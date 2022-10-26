class AddColumnCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :lastname, :string, null: false
    add_column :customers, :firstname, :string, null: false
    add_column :customers, :kana_last_name, :string, null: false
    add_column :customers, :kana_first_name, :string, null: false
    add_column :customers, :postcode, :string, null: false
    add_column :customers, :address, :string, null: false
    add_column :customers, :phone_number, :string, null: false
  end
end
