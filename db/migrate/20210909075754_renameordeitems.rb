class Renameordeitems < ActiveRecord::Migration[6.1]
  def change
    rename_table :order_items, :orderitems
  end
end
