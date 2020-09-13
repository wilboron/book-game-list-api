# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name, null: false
      t.text :bio, null: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
