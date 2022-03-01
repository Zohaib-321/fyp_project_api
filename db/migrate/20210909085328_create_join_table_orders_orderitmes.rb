class CreateJoinTableOrdersOrderitmes < ActiveRecord::Migration[6.1]
  def change
    create_join_table :orders, :order_items do |t|
      t.index [:order_id, :order_item_id]
      t.index [:order_item_id, :order_id]
    end
  end
end
