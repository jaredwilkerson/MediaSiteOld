# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100909153104) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.text     "description"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_played"
    t.string   "location"
  end

  create_table "shows", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_played"
    t.string   "location"
  end

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.string   "genre"
    t.string   "artist"
    t.string   "album"
    t.integer  "year"
    t.string   "picture"
    t.integer  "play_count"
    t.datetime "last_played"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
