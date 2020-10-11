class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :serie
      t.string :genre, null: false
      t.date :pub_date, null: false
      t.belongs_to :developer


      t.timestamps
    end
  end
end
