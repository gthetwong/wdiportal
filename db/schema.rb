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

ActiveRecord::Schema.define(version: 20140212191416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "attends", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attends", ["event_id"], name: "index_attends_on_event_id", using: :btree
  add_index "attends", ["user_id"], name: "index_attends_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "location"
    t.integer  "cost"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.time     "time"
  end

  create_table "gists", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "instructor"
  end

  create_table "group_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_projects", ["project_id"], name: "index_group_projects_on_project_id", using: :btree
  add_index "group_projects", ["user_id"], name: "index_group_projects_on_user_id", using: :btree

  create_table "labs", force: true do |t|
    t.string   "url"
    t.string   "comment"
    t.string   "feeling"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "assignment_id"
  end

  add_index "labs", ["assignment_id"], name: "index_labs_on_assignment_id", using: :btree
  add_index "labs", ["user_id"], name: "index_labs_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "technology"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "resources", ["user_id"], name: "index_resources_on_user_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "home"
    t.string   "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "squads", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "role",                   default: "student"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "squad_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["squad_id"], name: "index_users_on_squad_id", using: :btree

  create_table "users_visits", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "visit_id"
  end

  create_table "visits", force: true do |t|
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
