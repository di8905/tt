class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :code
      t.boolean :active, default: true, null: false
      t.belongs_to :coupon, index: true, unique: true
      t.timestamps
    end
  end
end
