class Addusersidtomanfdistmedstores < ActiveRecord::Migration[6.1]
  def change
    add_reference :distributors, :users, null: false, foreign_key: true
    add_reference :manufactors, :users, null: false, foreign_key: true
    add_reference :medstores, :users, null: false, foreign_key: true
  end
end
