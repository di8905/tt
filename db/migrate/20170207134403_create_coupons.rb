class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.belongs_to :deal
      t.boolean :actual, default: false, null: false

      t.timestamps
    end
  end
end
