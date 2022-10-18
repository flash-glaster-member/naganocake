class ChangeColumnNameAboutVolumeToAmount < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_products, :volume, :amount
    rename_column :order_details, :volume, :amount
    rename_column :orders, :oder_status, :status
    rename_column :order_details, :oder_id, :order_id


  end
end
