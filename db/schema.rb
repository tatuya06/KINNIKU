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

ActiveRecord::Schema[8.0].define(version: 2025_03_09_170223) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "master_menu", primary_key: "menu_id", id: :serial, force: :cascade do |t|
    t.string "menu_name", limit: 255
    t.integer "part_kbn"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "master_menus", force: :cascade do |t|
    t.string "menu_name"
    t.integer "part_kbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule", primary_key: "schedule_id", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "youbi_kbn"
    t.integer "menu_id"
    t.integer "menu_rep"
    t.integer "count"
    t.integer "kg"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id"
    t.integer "youbi_kbn"
    t.integer "menu_id"
    t.integer "menu_rep"
    t.integer "count"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_results", id: :serial, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "bench_press"
    t.integer "deadlift"
    t.integer "barbell_squat"
    t.integer "pullup"
    t.integer "dumbbell_arm_curl"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "mail_address"
    t.integer "weight"
    t.integer "hight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "schedule", "master_menu", column: "menu_id", primary_key: "menu_id", name: "schedule_menu_id_fkey"
  add_foreign_key "schedule", "users", name: "schedule_user_id_fkey"
  add_foreign_key "training_results", "users", name: "fk_user", on_delete: :cascade
end
