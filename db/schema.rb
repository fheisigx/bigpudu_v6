# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170809153321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "career_courses", force: :cascade do |t|
    t.bigint "career_id"
    t.bigint "course_id"
    t.integer "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_career_courses_on_career_id"
    t.index ["course_id"], name: "index_career_courses_on_course_id"
  end

  create_table "careers", force: :cascade do |t|
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "master_career_id"
    t.index ["institution_id"], name: "index_careers_on_institution_id"
    t.index ["master_career_id"], name: "index_careers_on_master_career_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "code_name"
    t.string "name"
    t.bigint "institution_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_courses_on_area_id"
    t.index ["institution_id"], name: "index_courses_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_career_areas", force: :cascade do |t|
    t.bigint "master_career_id"
    t.bigint "area_id"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_master_career_areas_on_area_id"
    t.index ["master_career_id"], name: "index_master_career_areas_on_master_career_id"
  end

  create_table "master_careers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "name"
    t.boolean "is_teacher", default: false
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_digest"], name: "index_users_on_remember_digest"
  end

  add_foreign_key "career_courses", "careers"
  add_foreign_key "career_courses", "courses"
  add_foreign_key "careers", "institutions"
  add_foreign_key "careers", "master_careers"
  add_foreign_key "courses", "areas"
  add_foreign_key "courses", "institutions"
  add_foreign_key "master_career_areas", "areas"
  add_foreign_key "master_career_areas", "master_careers"
end
