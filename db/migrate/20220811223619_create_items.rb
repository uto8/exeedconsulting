class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :is_sold, default: false
      t.integer :item_status, null: false, default: 0
      t.integer :delivery_fee, null: false, default: 0
      t.integer :delivery_day, null: false, default: 0

      t.timestamps
    end
  end
end
