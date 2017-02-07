class Deal < ApplicationRecord
  DEAL_TYPES = %w(sertificate price_fix discount)

  validates :max_coupon_limit, :start_time, :duration, presence: true
  validates :deal_type, presence: true
  validates_inclusion_of :type, in: DEAL_TYPES

  has_many :coupons

  def deal_held
    transaction do
      self.update(held: true)
      self.coupons.each do |coupon|
        coupon.update(actual: true)
      end
    end
  end

  def over?
    start_time + duration >= Time.now
  end


end
