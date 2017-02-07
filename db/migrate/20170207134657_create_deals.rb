class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.integer :max_coupon_limit, null: false
      t.integer :min_coupon_limit
      t.boolean :held, default: false, null: false
      t.string :deal_type
      t.datetime :start_time
      t.datetime :duration

      t.timestamps
    end
  end
end
