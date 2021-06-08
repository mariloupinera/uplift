class Application < ApplicationRecord
  belongs_to :favour
  belongs_to :user
  enum status: [:accepted, :declined, :pending]
  enum done: [:completed, :not_completed]
end
