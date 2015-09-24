# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150924064137) do

  create_table "students", force: :cascade do |t|
    t.string   "enroll_no",     limit: 30,    default: "", null: false
    t.string   "first_name",    limit: 30,    default: "", null: false
    t.string   "last_name",     limit: 30,    default: "", null: false
    t.string   "email",         limit: 60,    default: "", null: false
    t.integer  "gender",        limit: 4,     default: 0,  null: false
    t.date     "date_of_birth"
    t.string   "phone",         limit: 255
    t.text     "address",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["email"], name: "index_students_on_email", using: :btree
  add_index "students", ["first_name"], name: "index_students_on_first_name", using: :btree
  add_index "students", ["last_name"], name: "index_students_on_last_name", using: :btree

end
