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

ActiveRecord::Schema.define(:version => 20130901052437) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "home_bars", :force => true do |t|
    t.string   "name",                         :null => false
    t.string   "description"
    t.string   "phone_number"
    t.string   "cellphone_number"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "zip"
    t.string   "country_bar",                  :null => false
    t.string   "address",                      :null => false
    t.integer  "number",                       :null => false
    t.string   "complement",                   :null => false
    t.string   "neighborhood",                 :null => false
    t.string   "state",                        :null => false
    t.string   "city",                         :null => false
    t.string   "gallery_image_file_name"
    t.string   "gallery_image_content_type"
    t.integer  "gallery_image_file_size"
    t.datetime "gallery_image_updated_at"
    t.string   "events_image_file_name"
    t.string   "events_image_content_type"
    t.integer  "events_image_file_size"
    t.datetime "events_image_updated_at"
    t.string   "contact_image_file_name"
    t.string   "contact_image_content_type"
    t.integer  "contact_image_file_size"
    t.datetime "contact_image_updated_at"
    t.string   "follow_fb_image_file_name"
    t.string   "follow_fb_image_content_type"
    t.integer  "follow_fb_image_file_size"
    t.datetime "follow_fb_image_updated_at"
    t.integer  "category_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "principals", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "gallery_image_file_name"
    t.string   "gallery_image_content_type"
    t.integer  "gallery_image_file_size"
    t.datetime "gallery_image_updated_at"
    t.string   "events_image_file_name"
    t.string   "events_image_content_type"
    t.integer  "events_image_file_size"
    t.datetime "events_image_updated_at"
    t.string   "contact_image_file_name"
    t.string   "contact_image_content_type"
    t.integer  "contact_image_file_size"
    t.datetime "contact_image_updated_at"
    t.string   "follow_fb_image_file_name"
    t.string   "follow_fb_image_content_type"
    t.integer  "follow_fb_image_file_size"
    t.datetime "follow_fb_image_updated_at"
    t.string   "follow_tw_image_file_name"
    t.string   "follow_tw_image_content_type"
    t.integer  "follow_tw_image_file_size"
    t.datetime "follow_tw_image_updated_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end
