class Chengecolumntype < ActiveRecord::Migration[6.1]
  def change
    change_column :addresses, :post_code, :string
  end
end
