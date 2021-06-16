class Favour < ApplicationRecord
  belongs_to :user
  belongs_to :favour_type
  has_many :applications, dependent: :destroy
  validates :duration, presence: true
  validates :description, presence: true
  validates :zone, presence: true
  has_one_attached :photo






  geocoded_by :zone
  after_validation :geocode, if: :will_save_change_to_zone?


end

