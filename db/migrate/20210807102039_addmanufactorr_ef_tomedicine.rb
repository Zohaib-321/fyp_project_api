class AddmanufactorrEfTomedicine < ActiveRecord::Migration[6.1]
  def change
    add_reference :medicines, :manufactors, null: false, foreign_key: true
  end
end
