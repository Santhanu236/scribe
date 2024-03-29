# frozen_string_literal: true

class AddUserRefToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogs, :users, foreign_key: true
  end
end
