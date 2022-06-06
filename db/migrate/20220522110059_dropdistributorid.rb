class Dropdistributorid < ActiveRecord::Migration[6.1]
  def change
    remove_column :manufactors, :distributor_id, :integer
  end
end
