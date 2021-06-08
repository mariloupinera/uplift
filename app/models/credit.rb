class Credit < ApplicationRecord
  belongs_to :application
  belongs_to :favour
  belongs_to :user, through: :applications
end
