class Renameordertbale < ActiveRecord::Migration[6.1]
  def change
    rename_table :orderitems, :order_items
  end
end
