class ChangeTableNameOderToOrder < ActiveRecord::Migration[6.1]
  def up
    rename_table :oder, :order
  end

  def down
    rename_table :order, :oder
  end
end
