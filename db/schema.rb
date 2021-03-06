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

ActiveRecord::Schema.define(version: 20131005112944) do

  create_table "problems", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "time_limit",  default: 4000
    t.integer  "mem_limit",   default: 131072
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",     default: true
  end

  create_table "submissions", force: true do |t|
    t.integer  "problem_id"
    t.integer  "user_id"
    t.string   "ip"
    t.string   "code",       limit: 32
    t.integer  "time_cost"
    t.string   "status"
    t.text     "msg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["problem_id"], name: "index_submissions_on_problem_id"
  add_index "submissions", ["status"], name: "index_submissions_on_status"
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["student_id"], name: "index_users_on_student_id", unique: true

end
