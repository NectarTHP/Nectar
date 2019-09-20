class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price
      t.string :picture_url
      t.string :categorie
      t.integer :weight
      t.integer :size
      t.date :sale
      t.string :tag

      t.timestamps
    end
  end
end