class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :item_qty
      t.integer :order_number
      t.string :tracking_number

      t.timestamps
    end
  end
end