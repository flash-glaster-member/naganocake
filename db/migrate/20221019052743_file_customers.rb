class FileCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :lastname, :string
    add_column :customers, :firstname, :string
    add_column :customers, :kana_last_name, :string
    add_column :customers, :kana_first_name, :string
    add_column :customers, :postcode, :string
    add_column :customers, :address, :string
  end
end
