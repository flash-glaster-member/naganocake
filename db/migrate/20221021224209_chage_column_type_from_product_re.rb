class ChageColumnTypeFromProductRe < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :genre, :genre_id
    change_column :products, :genre_id, :integer, using: "genre_id::integer"


  end
end
