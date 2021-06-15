class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates_uniqueness_of :username
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :applications, dependent: :destroy
  has_many :favours, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills
  has_many :credits
  # has_many :favour_applications, through: :favours, source: :applications
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  def completed_applications
    applications.where(status: 0, done: 0)
  end

  def check_credit
    Credit.joins(application: :user).where(applications: {status: 0, done: 0, user: self })
  end

  def balance
    credits_earned - credit_redeemed
  end

  def credits_earned
    # favours.joins(:applications).joins(:favour_type).where("applications.status = 0 AND applications.done = 0").sum("favour_types.amount_available")
    applications.joins(:favour).joins("join favour_types ON favours.favour_type_id = favour_types.id").where(status: 0, done: 0).sum("favour_types.amount_available")
  end

  def credit_redeemed
    credits.sum(:amount_redeemed)
  end
end
