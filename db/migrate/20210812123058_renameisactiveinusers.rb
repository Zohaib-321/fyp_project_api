class Renameisactiveinusers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :isactive, :is_active
  end
end
