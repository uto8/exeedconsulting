class AddUsersToUniversity < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :university, null: true, foreign_key: true
    add_reference :items, :university, null: true, foreign_key: true
  end
end
