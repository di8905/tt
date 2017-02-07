class Code < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  belongs_to :coupon

  def initialize(given_code = nil)
    if given_code
      self.code = given_code
    else
      self.code = generate_code
    end
  end

  private

  def generate_code
    rand(100_000_000_000..999_999_999_999)
  end

end
