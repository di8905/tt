class Coupon < ApplicationRecord
  has_one :code
  belongs_to :deal

  validates :code, presence: true

  def valid?
    self.code.active && self.deal.held
  end
end
