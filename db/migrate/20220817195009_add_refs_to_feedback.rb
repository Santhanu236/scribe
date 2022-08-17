class AddRefsToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_reference :feedbacks, :users, foreign_key: true
  end
end
