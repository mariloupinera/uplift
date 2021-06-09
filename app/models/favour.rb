class Favour < ApplicationRecord
  belongs_to :user
  belongs_to :favour_type
  has_many :applications, dependent: :destroy
  validates :duration, presence: true
  validates :description, presence: true
  validates :zone, presence: true
end

