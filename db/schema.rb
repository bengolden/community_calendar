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

ActiveRecord::Schema.define(version: 20180128230715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "venue_name"
    t.string   "venue_address"
    t.string   "venue_url"
    t.string   "sponsor_name"
    t.string   "sponsor_url"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "tickets_price"
    t.string   "tickets_details"
    t.string   "tickets_url"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "deleted"
    t.boolean  "recurring"
    t.string   "recurring_duration"
    t.integer  "recurring_source_id"
    t.string   "facebook_url"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "support_email"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "email"
    t.integer  "duration",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
