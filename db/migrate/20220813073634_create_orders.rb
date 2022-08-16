class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :buyer, foreign_key: { to_table: :users }, null: true
      t.references :seller, foreign_key: { to_table: :users }, null: true
      t.references :item, foreign_key: { to_table: :items }, null: true

      t.timestamps
    end
  end
end
