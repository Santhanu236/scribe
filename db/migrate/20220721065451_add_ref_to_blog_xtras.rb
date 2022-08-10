# frozen_string_literal: true

class AddRefToBlogXtras < ActiveRecord::Migration[6.1]
  def change
    add_reference :blog_xtras, :users, foreign_key: true
  end
end
