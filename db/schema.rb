# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_10_23_090349) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.date "published_year"
    t.integer "available_copies"
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "borrowings", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "book_id", null: false
    t.date "borrow_date"
    t.date "due_date"
    t.date "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_borrowings_on_book_id"
    t.index ["member_id"], name: "index_borrowings_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "type"
    t.integer "refered_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "reviewable_type", null: false
    t.integer "reviewable_id", null: false
    t.text "text"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_reviews_on_member_id"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
  end

  add_foreign_key "books", "authors"
  add_foreign_key "borrowings", "books"
  add_foreign_key "borrowings", "members"
  add_foreign_key "reviews", "members"
end
