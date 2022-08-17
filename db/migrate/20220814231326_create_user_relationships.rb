class CreateUserRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :user_relationships do |t|
      t.integer :user
      t.integer :follower
      t.timestamps
    end
  end
end
