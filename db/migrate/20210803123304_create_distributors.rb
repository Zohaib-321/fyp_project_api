class CreateDistributors < ActiveRecord::Migration[6.1]
  def change
    create_table :distributors do |t|
      t.string :name
      t.string :license
      t.integer :number

      t.timestamps
    end
  end
end
