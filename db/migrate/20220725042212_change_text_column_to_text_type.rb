class ChangeTextColumnToTextType < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :text, :text
  end
end
