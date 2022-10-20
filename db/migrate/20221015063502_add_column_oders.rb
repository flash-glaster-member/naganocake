class AddColumnOders < ActiveRecord::Migration[6.1]
  def change
    add_column :oders, :postage, :integer
  end
end