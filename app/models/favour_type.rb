class FavourType < ApplicationRecord
  has_many :favours, dependent: :destroy
  validates :content, presence: true, uniqueness: true
  TYPES = ["Plumbing", "Cleaning", "Electrical", "Painting"]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
