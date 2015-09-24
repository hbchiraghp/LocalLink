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

ActiveRecord::Schema.define(version: 20150924065453) do

  create_table "students", force: true do |t|
    t.string   "enroll_no",     limit: 30, default: "",    null: false
    t.string   "first_name",    limit: 30, default: "",    null: false
    t.string   "last_name",     limit: 30, default: "",    null: false
    t.string   "email",         limit: 60, default: "",    null: false
    t.integer  "gender"
    t.date     "date_of_birth"
    t.string   "phone"
    t.string   "address1",                 default: "",    null: false
    t.string   "address2",                 default: "",    null: false
    t.string   "city",          limit: 50
    t.string   "country",       limit: 50
    t.string   "postcode",      limit: 10, default: "",    null: false
    t.string   "avatar"
    t.integer  "status",                   default: 1,     null: false
    t.boolean  "deleted",                  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
