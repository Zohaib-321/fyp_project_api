class OrderItem < ApplicationRecord
    belongs_to :orders, optional: true
    #belongs_to :medicines, optional: true, join_table: 'order_items'
end
