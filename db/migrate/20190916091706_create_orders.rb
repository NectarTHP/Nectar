class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :adress
      t.string :city
      t.string :country
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
