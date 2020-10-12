class CreateReads < ActiveRecord::Migration[6.0]
  def change
    create_table :reads do |t|
      t.boolean :did_not_finished, default: false
      t.integer :medium, null:false
      t.date :start_date, null: false
      t.date :end_date
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
