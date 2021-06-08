class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :applications, dependent: :destroy
  has_many :favours, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :skills, presence: true
end
