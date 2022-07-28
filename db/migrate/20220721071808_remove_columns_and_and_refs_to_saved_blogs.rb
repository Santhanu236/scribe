class RemoveColumnsAndAndRefsToSavedBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :saved_blogs, :user_id, :integer
    remove_column :saved_blogs, :blog_id, :integer
    add_reference :saved_blogs, :users, foreign_key: true
    add_reference :saved_blogs, :blogs, foreign_key: true
  end
end
