# frozen_string_literal: true

class RemoveBlogIdFromBlogXtras < ActiveRecord::Migration[6.1]
  def change
    remove_column :blog_xtras, :blog_id, :integer
  end
end
