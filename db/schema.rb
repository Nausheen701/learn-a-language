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

ActiveRecord::Schema.define(version: 2021_04_02_135653) do

  create_table "courses", force: :cascade do |t|
    t.string "language"
    t.string "level"
    t.string "age_group"
    t.string "class_size"
    t.string "location"
    t.string "day"
    t.string "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "instructors_id", null: false
    t.integer "students_id", null: false
    t.index ["instructors_id"], name: "index_courses_on_instructors_id"
    t.index ["students_id"], name: "index_courses_on_students_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "phone"
    t.string "number"
    t.string "nationality"
    t.string "ethnicity"
    t.string "native_language"
    t.string "other_languages"
    t.string "instructional_languages"
    t.date "date_of_birth"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "language"
    t.string "level"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "phone"
    t.string "number"
    t.string "nationality"
    t.string "ethnicity"
    t.string "native_language"
    t.string "other_languages"
    t.date "date_of_birth"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "courses_id", null: false
    t.index ["courses_id"], name: "index_students_on_courses_id"
  end

  add_foreign_key "courses", "instructors", column: "instructors_id"
  add_foreign_key "courses", "students", column: "students_id"
  add_foreign_key "students", "courses", column: "courses_id"
end
