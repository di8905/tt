class CertificateDeal < Deal
  def self.benefit(full_price)
    full_price - coupon_price
  end

end
