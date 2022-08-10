# frozen_string_literal: true

class AddColumnToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :category, :string
  end
end
