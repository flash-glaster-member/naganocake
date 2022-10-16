class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :product_image, :string
    rename_column :products, :sales_status, :is_active
  end
end
