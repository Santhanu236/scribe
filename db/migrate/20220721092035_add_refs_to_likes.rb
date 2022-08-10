# frozen_string_literal: true

class AddRefsToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :users, foreign_key: true
    add_reference :likes, :blogs, foreign_key: true
  end
end
