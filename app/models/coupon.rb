class Coupon < ApplicationRecord
  belongs_to :deal

  after_initialize :init

  validates :code, presence: true, uniqueness: true

  scope :available, -> { where(user_id: nil) }
  scope :purchased, -> { where.not(user_id: nil)}

  def init
    self.code ||= generate_code
  end

  def actual?
    self.deal.succeed
  end

  private

  def generate_code
    begin
      code = rand(100000..999999)
    end while Coupon.find_by_code(code)
    code
  end
end
