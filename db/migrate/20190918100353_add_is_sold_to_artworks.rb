class AddIsSoldToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :is_sold, :boolean, default: false, null: false
  end
end
