class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :blog_id
      t.string :user_id
      t.string :comment_text

      t.timestamps
    end
  end
end
