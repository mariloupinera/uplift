class Application < ApplicationRecord
  belongs_to :favour
  belongs_to :user
  enum status: [:accepted, :declined, :pending]
  enum done: [:completed, :incomplete]
  validate :application_cannot_be_completed_unless_accepted
  validate :favour_creator_cannot_make_application
  # validate :user, uniqueness: { scope: :favour }  # Uncomment when running the app

  def application_cannot_be_completed_unless_accepted
    if completed? && !accepted?
      errors.add(:done, "Favour cannot be completed unless application has been accepted")
    end
  end

  def favour_creator_cannot_make_application
    if favour.user == self.user
      errors.add(:status, "You cannot apply to your own favour")
    end
  end

  def policy_class
    AppsPolicy
  end

  def self.policy_class
    AppsPolicy
  end

  def name
    favour.description
  end

  def amount_formatted
    "+#{favour.favour_type.amount_available}"
  end
end
