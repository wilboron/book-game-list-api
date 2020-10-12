# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_12_022803) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.integer "num_pages", null: false
    t.string "genre", null: false
    t.string "serie"
    t.date "pub_date", null: false
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "title", null: false
    t.string "serie"
    t.string "genre", null: false
    t.date "pub_date", null: false
    t.integer "developer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["developer_id"], name: "index_games_on_developer_id"
  end

  create_table "plays", force: :cascade do |t|
    t.boolean "did_not_finished", default: false
    t.integer "minutes_played", default: 0
    t.integer "plataform", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.integer "game_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_plays_on_game_id"
    t.index ["user_id"], name: "index_plays_on_user_id"
  end

  create_table "reads", force: :cascade do |t|
    t.boolean "did_not_finished", default: false
    t.integer "medium", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_reads_on_book_id"
    t.index ["user_id"], name: "index_reads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name", null: false
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "plays", "games"
  add_foreign_key "plays", "users"
  add_foreign_key "reads", "books"
  add_foreign_key "reads", "users"
end
