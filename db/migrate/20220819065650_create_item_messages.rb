class CreateItemMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_messages do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
