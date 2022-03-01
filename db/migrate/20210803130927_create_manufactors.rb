class CreateManufactors < ActiveRecord::Migration[6.1]
  def change
    create_table :manufactors do |t|
      t.string :name
      t.string :license
      t.string :address
      t.integer :number

      t.timestamps
    end
  end
end
, 