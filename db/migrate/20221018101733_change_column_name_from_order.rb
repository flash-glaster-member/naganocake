class ChangeColumnNameFromOrder < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :send_name, :name
    rename_column :orders, :send_address, :address
  end
end
