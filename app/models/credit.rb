class Credit < ApplicationRecord
  belongs_to :application
  belongs_to :favour
  has_one :user, through: :application

  def amount_available
    favour.favour_type.amount_available
  end

  def balance
    (favour.favour_type.amount_available) - amount_redeemed
  end
end
