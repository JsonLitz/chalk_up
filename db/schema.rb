
ActiveRecord::Schema.define(version: 20160826001150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "climbs", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "image_url"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "geolocation"
    t.integer  "rating"
    t.string   "gear",                      array: true
    t.string   "type"
    t.boolean  "is_gym?"
    t.boolean  "verification"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "climb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["climb_id"], name: "index_comments_on_climb_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "image_url"
    t.string   "email"
    t.boolean  "is_admin?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "climbs"
  add_foreign_key "comments", "users"
end
