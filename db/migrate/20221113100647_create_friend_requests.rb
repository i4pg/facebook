class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :requestor, null: false, foreign_key: { to_table: :users }
      t.references :recevier, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
