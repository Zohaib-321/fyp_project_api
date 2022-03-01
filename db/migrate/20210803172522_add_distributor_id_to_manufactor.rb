class AddDistributorIdToManufactor < ActiveRecord::Migration[6.1]
  
  def change
    add_column :manufactors, :distributor_id, :integer, null: false
  end
end
