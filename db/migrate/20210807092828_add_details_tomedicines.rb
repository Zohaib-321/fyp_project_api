class AddDetailsTomedicines < ActiveRecord::Migration[6.1]
  def change
    add_column :medicines, :batch_no, :string
    add_column :medicines, :exp_date, :integer
    add_column :medicines, :manf_date, :integer
  end
end
