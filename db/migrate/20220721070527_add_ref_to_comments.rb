class AddRefToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :users, foreign_key: true
    add_reference :comments, :blogs, foreign_key: true
  end
end
