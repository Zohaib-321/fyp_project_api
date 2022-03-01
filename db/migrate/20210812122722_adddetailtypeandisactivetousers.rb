class Adddetailtypeandisactivetousers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :detail_type, :string 
    add_column :users, :isactive, :boolean , default: true 
  end
end
