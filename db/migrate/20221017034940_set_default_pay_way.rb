class SetDefaultPayWay < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :pay_way, from:nil, to:"cledit_card"
  end
end
