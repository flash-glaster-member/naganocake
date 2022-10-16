class ChangeData < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :sales_status, :boolean
  end
end
