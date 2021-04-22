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

ActiveRecord::Schema.define(version: 2021_04_01_105953) do

  create_table "courses", force: :cascade do |t|
    t.string "language"
    t.string "level"
    t.string "age_group"
    t.string "class_size"
    t.string "location"
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.integer "student_id"
    t.integer "instructor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "phone_number"
    t.string "nationality"
    t.string "ethnicity"
    t.string "native_language"
    t.string "other_languages"
    t.string "instructional_languages"
    t.date "date_of_birth"
    t.text "education"
    t.text "teaching_experience"
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
    t.string "phone_number"
    t.string "nationality"
    t.string "ethnicity"
    t.string "native_language"
    t.string "other_languages"
    t.date "date_of_birth"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
