class Application < ApplicationRecord
  belongs_to :favour
  belongs_to :user
  has_one :credit, dependent: :destroy
  enum status: [:accepted, :declined, :pending]
  enum done: [:completed, :incomplete]
  validate :application_cannot_be_completed_unless_accepted
  # validate :user, uniqueness: { scope: :favour }  # Uncomment when running the app

  def application_cannot_be_completed_unless_accepted
    if completed? && !accepted?
      errors.add(:done, "Favour cannot be completed unless application has been accepted")
    end
  end

  def policy_class
    AppsPolicy
  end
end
