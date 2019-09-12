class AddUserDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_artist, :boolean
    add_column :users, :is_admin, :boolean, null: false
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :avatarpicture, :string
    add_column :users, :dateofbirth, :date
    add_column :users, :siret, :string
    add_column :users, :adress, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :mobile, :string
    add_column :users, :fb_user_ID, :string
    add_column :users, :insta_user_ID, :string
  end
end
