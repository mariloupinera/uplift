class FavourType < ApplicationRecord
  has_many :favours, dependent: :destroy
  validates :content, presence: true, uniqueness: true
  TYPES = ["Plumbing", "Cleaning", "Electrical", "Painting"]
  # TYPES = {
  #   Plumbing: 20,
  #   Cleaning: 20,
  #   Electrical: 30,
  #   Painting: 30
  # }

  # def amount_available
  #   self.amount_available == FavourType::TYPES[:xx]
  # end
end
