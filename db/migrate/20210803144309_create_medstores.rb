class CreateMedstores < ActiveRecord::Migration[6.1]
  def change
    create_table :medstores do |t|
      t.string :name
      t.string :license
      t.integer :number
      t.string :address

      t.timestamps
    end
  end
end
