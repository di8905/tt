class FixedDiscount < Deal
  def self.benefit(full_price)
    full_price - (full_price * discount_percent/100 + coupon_price)
  end
end
