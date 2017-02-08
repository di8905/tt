class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.belongs_to :deal
      t.boolean :actual, default: false, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
