class AddColumnsToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :genre_name, :string

    add_column :oders, :user_id, :integer
    add_column :oders, :post_code, :integer
    add_column :oders, :send_address, :text
    add_column :oders, :send_name, :string
    add_column :oders, :total_price, :integer
    add_column :oders, :pay_way, :integer
    add_column :oders, :oder_status, :integer

    add_column :oder_details, :product_id, :integer
    add_column :oder_details, :oder_id, :integer
    add_column :oder_details, :product_price, :integer
    add_column :oder_details, :volume, :integer
    add_column :oder_details, :production_status, :integer

    add_column :addresses, :user_id, :integer
    add_column :addresses, :send_name, :string
    add_column :addresses, :send_address, :text
    add_column :addresses, :post_code, :integer


  end
end
