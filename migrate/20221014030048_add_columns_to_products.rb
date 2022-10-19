class AddColumnsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :genre_id, :integer
    add_column :products, :product_name, :string
    add_column :products, :product_image, :string
    add_column :products, :product_description, :text
    add_column :products, :product_price, :integer
    add_column :products, :sales_status, :integer
  end
end