class RemoveUserFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :user, :integer
  end
end
