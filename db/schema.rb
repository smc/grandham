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

ActiveRecord::Schema.define(version: 20130918181945) do

  create_table "authors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "language_id"
    t.string "grandham_id"
  end

  create_table "authorships", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "author_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "availabilities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "library_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "grandham_id"
    t.integer "language_id"
    t.text "title"
    t.string "isbn"
    t.string "pages"
    t.string "year"
    t.text "description"
    t.string "edition"
    t.string "ddc"
    t.string "volume"
    t.string "series"
    t.string "price"
    t.string "length"
    t.text "title_orginal"
    t.text "illustrator"
    t.text "note"
    t.text "preface"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "approved"
    t.boolean "published", default: true
  end

  create_table "edits", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "field"
    t.text "old_value"
    t.text "new_value"
    t.integer "user_id"
    t.string "editable_type"
    t.integer "editable_id"
    t.string "state", default: "open"
    t.integer "reviewed_by_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "language_id"
    t.integer "book_id"
  end

  create_table "languages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name"
    t.string "short_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "default", default: false
  end

  create_table "libraries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name"
    t.string "grandham_id"
    t.integer "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "place"
  end

  create_table "new_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "reviewed_by_user_id"
    t.string "state", default: "open"
    t.integer "user_id"
    t.integer "language_id"
    t.string "creatable_type"
    t.integer "creatable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "type"
  end

  create_table "publications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "publisher_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "language_id"
    t.string "grandham_id"
    t.text "place"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "role"
    t.string "login"
    t.integer "language_id"
    t.integer "publisher_id"
    t.integer "library_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
