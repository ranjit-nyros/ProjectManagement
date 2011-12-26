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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111222111623) do

  create_table "developers", :force => true do |t|
    t.string   "developer_name"
    t.string   "developer_email"
    t.string   "developer_platform"
    t.date     "date_of_join"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers_projects", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "developer_id"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "project_title"
    t.text     "project_description"
    t.date     "project_started"
    t.date     "project_ended"
    t.string   "project_platform"
    t.string   "project_owner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url_path"
    t.string   "tecnology_used"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 25
    t.string   "email",           :limit => 30
    t.string   "salt",            :limit => 40
  end

end
