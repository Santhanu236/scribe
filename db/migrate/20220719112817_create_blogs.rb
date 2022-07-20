class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.integer :user
      t.string :title
      t.string :description
      t.string :text
      t.string :img_url

      t.timestamps
    end
  end
end
