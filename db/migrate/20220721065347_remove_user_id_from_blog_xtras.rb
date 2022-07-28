class RemoveUserIdFromBlogXtras < ActiveRecord::Migration[6.1]
  def change
    remove_column :blog_xtras, :user_id, :integer
  end
end
