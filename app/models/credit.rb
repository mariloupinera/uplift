class Credit < ApplicationRecord
  belongs_to :user

  def name
    'Redeemed'
  end

  def amount_formatted
    "-#{amount_redeemed}"
  end
end
