class ChangeColumnNameGenre < ActiveRecord::Migration[6.1]
  def change
    rename_column :genres, :genre_name, :name
  end
end
