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

ActiveRecord::Schema[7.0].define(version: 2024_02_09_000122) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breads", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id", null: false
    t.string "ingredients"
    t.string "instructions"
    t.string "imageUrl"
    t.index ["country_id"], name: "index_breads_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "overview"
    t.string "culinary"
    t.string "imageUrl"
  end

  create_table "user_breads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bread_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bread_id"], name: "index_user_breads_on_bread_id"
    t.index ["user_id"], name: "index_user_breads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "breads", "countries"
  add_foreign_key "user_breads", "breads"
  add_foreign_key "user_breads", "users"
end
