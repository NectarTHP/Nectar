class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price, :precision => 10, :scale => 2
      t.string :picture_url
      t.string :categorie
      t.decimal :weight
      t.decimal :width
      t.decimal :height
      t.date :sale
      t.string :tag

      t.timestamps
    end
  end
end