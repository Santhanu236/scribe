# frozen_string_literal: true

class RemoveColumnsFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :blog_id, :integer
    remove_column :comments, :user_id, :integer
  end
end
