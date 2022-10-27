class ChengeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :addresses, :send_address, :string
  end
end
