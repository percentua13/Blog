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

ActiveRecord::Schema.define(version: 2020_04_17_235926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.text "media", null: false
    t.text "about"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.datetime "dateTime", null: false
    t.bigint "author_id", null: false
    t.bigint "post_id", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "post2tags", id: false, force: :cascade do |t|
    t.string "tag_id", null: false
    t.bigint "post_id", null: false
    t.index ["post_id"], name: "index_post2tags_on_post_id"
    t.index ["tag_id"], name: "index_post2tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.text "media", null: false
    t.datetime "dateTime", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

  create_table "tags", id: :string, force: :cascade do |t|
  end

  add_foreign_key "comments", "authors"
  add_foreign_key "comments", "posts"
  add_foreign_key "post2tags", "posts"
  add_foreign_key "post2tags", "tags"
  add_foreign_key "posts", "authors"
end
