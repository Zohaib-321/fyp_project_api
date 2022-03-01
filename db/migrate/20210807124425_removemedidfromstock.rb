class Removemedidfromstock < ActiveRecord::Migration[6.1]
  def change
    remove_column :stocks, :medicines_id, :string
  end
end
