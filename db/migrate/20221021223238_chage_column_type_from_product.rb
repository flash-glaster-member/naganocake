class ChageColumnTypeFromProduct < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :genre_id, :string
    rename_column :products, :genre_id, :genre
  end
end
