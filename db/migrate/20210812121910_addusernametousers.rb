class Addusernametousers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string , :unique => true
    add_index :users, :email, unique: true

  end
end
