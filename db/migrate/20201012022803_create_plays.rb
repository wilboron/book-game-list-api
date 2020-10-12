class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.boolean :did_not_finished, default: false
      t.integer :minutes_played, default: 0
      t.integer :plataform, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
