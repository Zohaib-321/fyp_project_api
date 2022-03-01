class Removecolumnfromorder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :items
    remove_column :orders, :price
    remove_column :orders, :status
    remove_column :orders, :quantity
  end
end
