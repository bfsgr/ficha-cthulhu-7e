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

ActiveRecord::Schema.define(version: 2020_06_19_184115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "ocupation"
    t.string "scholarity"
    t.string "birth_place"
    t.integer "age"
    t.text "mental_illnesses"
    t.string "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "current_stats", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "max_life"
    t.integer "life"
    t.integer "max_san"
    t.integer "san"
    t.integer "max_mag"
    t.integer "mag"
    t.integer "armour"
    t.boolean "dying"
    t.boolean "insan_temp"
    t.boolean "insan_indef"
    t.boolean "dead_insan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_current_stats_on_character_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "character_id"
    t.string "name"
    t.integer "base"
    t.integer "value"
    t.boolean "sucess"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_skills_on_character_id"
  end

  create_table "stats", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "str"
    t.integer "dex"
    t.integer "int"
    t.integer "con"
    t.integer "app"
    t.integer "pow"
    t.integer "siz"
    t.integer "edu"
    t.integer "luc"
    t.integer "mov"
    t.string "bon"
    t.integer "lvl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_stats_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "invite"
    t.string "e_password"
    t.string "salt"
    t.boolean "is_dm"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
