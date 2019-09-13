# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.text :comment
      t.boolean :is_artist
      t.boolean :is_admin
      t.string :username
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.date :dateofbirth
      t.string :siret
      t.string :adress
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :mobile
      t.string :fb_user_ID
      t.string :insta_user_ID

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
  def self.down

    remove_column :users, :reset_password_token

    remove_column :users, :reset_password_sent_at

    remove_column :users, :remember_created_at

    remove_index :users, :email

    begin

    remove_index :users, :reset_password_token

    rescue

    end

    # raise ActiveRecord::IrreversibleMigration

  end
end
