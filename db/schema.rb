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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130918165353) do

  create_table "authors", :force => true do |t|
    t.text     "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "language_id"
    t.string   "grandham_id"
  end

  create_table "authorships", :force => true do |t|
    t.integer  "author_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "availabilities", :force => true do |t|
    t.integer  "library_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "grandham_id"
    t.integer  "language_id"
    t.text     "title"
    t.string   "isbn"
    t.string   "pages"
    t.string   "year"
    t.text     "description"
    t.string   "edition"
    t.string   "ddc"
    t.string   "volume"
    t.string   "series"
    t.string   "price"
    t.string   "length"
    t.text     "title_orginal"
    t.text     "illustrator"
    t.text     "note"
    t.text     "preface"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "approved"
  end

  create_table "edits", :force => true do |t|
    t.string   "field"
    t.text     "old_value"
    t.text     "new_value"
    t.integer  "user_id"
    t.integer  "editable_id"
    t.string   "editable_type"
    t.string   "state",               :default => "open"
    t.integer  "reviewed_by_user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "language_id"
    t.integer  "book_id"
  end

  create_table "languages", :force => true do |t|
    t.text     "name"
    t.string   "short_code"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "default",    :default => false
  end

  create_table "libraries", :force => true do |t|
    t.text     "name"
    t.string   "grandham_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "place"
  end

  create_table "new_items", :force => true do |t|
    t.integer  "reviewed_by_user_id"
    t.string   "state",               :default => "open"
    t.integer  "user_id"
    t.integer  "language_id"
    t.integer  "creatable_id"
    t.string   "creatable_type"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "pictures", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "type"
  end

  create_table "publications", :force => true do |t|
    t.integer  "publisher_id"
    t.integer  "book_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "publishers", :force => true do |t|
    t.text     "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "language_id"
    t.string   "grandham_id"
    t.text     "place"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "role"
    t.string   "login"
    t.integer  "language_id"
    t.integer  "publisher_id"
    t.integer  "library_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
