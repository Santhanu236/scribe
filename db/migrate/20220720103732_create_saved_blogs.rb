class CreateSavedBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :saved_blogs do |t|
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
