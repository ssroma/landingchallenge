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

ActiveRecord::Schema.define(version: 2021_05_16_195215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_profiles", force: :cascade do |t|
    t.string "node_id"
    t.string "login"
    t.string "name"
    t.string "url"
    t.string "avatar_url"
    t.string "bio"
    t.integer "public_repos"
    t.integer "followers"
    t.integer "following"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
