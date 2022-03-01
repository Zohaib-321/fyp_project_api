class Removerolesfromuser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :role_id, :integer
    remove_column :users, :role_type, :string
  end
end
