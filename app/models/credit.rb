class Credit < ApplicationRecord
  belongs_to :application
  belongs_to :favour
  has_one :user, through: :application
end
