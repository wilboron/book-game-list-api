class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :num_pages, null: false
      t.string :genre, null: false
      t.string :serie
      t.date :pub_date, null: false
      t.belongs_to :author

      t.timestamps
    end
  end
end
