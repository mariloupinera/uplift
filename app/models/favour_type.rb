class FavourType < ApplicationRecord
  has_many :favours, dependent: :destroy
  validates :content, presence: true, uniqueness: true
  TYPES = ["Plumbing", "Cleaning", "Electrical", "Painting"]
end
