class AddUserIdToIteme < ActiveRecord::Migration[6.0]
  def change
    add_reference :itemes, :user, null: false, foreign_key: true
  end
end
