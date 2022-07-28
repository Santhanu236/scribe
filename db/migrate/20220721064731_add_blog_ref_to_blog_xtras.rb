class AddBlogRefToBlogXtras < ActiveRecord::Migration[6.1]
  def change
    add_reference :blog_xtras, :blogs, foreign_key: true
  end
end
