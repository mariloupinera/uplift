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
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  def completed_applications
    applications.where(status: 0, done: 0)
  end

  def check_credit
    Credit.joins(application: :user).where(applications: {status: 0, done: 0, user: self })
  end
end
