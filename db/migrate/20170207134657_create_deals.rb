class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.integer :max_coupon_limit, null: false
      t.integer :min_coupon_limit
      t.boolean :succeed, default: false, null: false
      t.string  :type
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.integer :coupon_price
      t.integer :full_price
      t.integer :discount_percent

      t.timestamps
    end
  end
end
