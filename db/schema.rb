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

ActiveRecord::Schema.define(version: 2020_05_05_032819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.integer "collectable_id"
    t.string "name"
    t.string "image"
    t.string "scientific_name"
    t.string "family"
    t.string "time_year"
    t.string "time_day"
    t.string "location"
    t.string "size"
    t.string "rarity"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collectables", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dailychecklists", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "checked_statuses"
  end

  create_table "dailychecklists_villagers", force: :cascade do |t|
    t.integer "dailychecklist_id", null: false
    t.integer "villager_id", null: false
  end

  create_table "fish", force: :cascade do |t|
    t.integer "collectable_id"
    t.string "name"
    t.string "image"
    t.string "scientific_name"
    t.string "family"
    t.string "time_year"
    t.string "time_day"
    t.string "location"
    t.string "size"
    t.string "rarity"
    t.string "price"
    t.string "shadow"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fossils", force: :cascade do |t|
    t.integer "collectable_id"
    t.string "name"
    t.string "image"
    t.string "scientific_name"
    t.string "sections"
    t.string "period"
    t.string "length"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer "user_id"
    t.date "time"
    t.string "hemisphere"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "dailychecklist_id"
    t.string "name"
    t.integer "num_of_boxes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_collectables", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "collectable_id", null: false
    t.boolean "is_collected"
    t.boolean "is_donated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villagers", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "quote"
    t.string "gender"
    t.string "personality"
    t.string "species"
    t.string "birthday"
    t.string "sign"
    t.string "phrase"
    t.string "clothes"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "siblings"
    t.string "goal"
    t.string "fear"
    t.string "favclothing"
    t.string "leastfavclothing"
    t.string "favcolor"
  end

end
