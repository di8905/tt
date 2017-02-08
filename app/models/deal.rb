class Deal < ApplicationRecord
  after_initialize :init

  has_many :coupons

  validates :min_coupon_limit, :max_coupon_limit, :start_time, :duration, presence: true

  def init
    max_coupon_limit = codepack.length if codepack
    self.min_coupon_limit ||= 0
    self.end_time ||= start_time + duration
    generate_coupons
  end

  def buy_coupon(user_id)
    return false unless deal_actual?
    coupons.available.first.update(user_id: user_id)
    actuate_coupons if deal_succeed?
  end

  def deal_actual?
    !over? && !coupons.available.empty?
  end

  def deal_succeed?
    coupons.purchased.size >= min_coupon_limit
  end

  def actuate_coupons
    self.coupons.each { |coupon| coupon.update(actual: true) }
  end

  def generate_coupons
    if codepack
      codepack.each do |code|
        self.coupons.create(code: code)
      end
    else
      self.max_coupon_limit.times { self.coupons.create }
    end
  end

  def over?
    end_time <= Time.zone.now
  end
end
