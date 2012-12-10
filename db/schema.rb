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

ActiveRecord::Schema.define(:version => 20121210190718) do

  create_table "cards", :force => true do |t|
    t.string   "status",         :default => "in_progress", :null => false
    t.string   "access_token"
    t.integer  "destination_id",                            :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "cards", ["access_token"], :name => "index_cards_on_access_token", :unique => true
  add_index "cards", ["destination_id"], :name => "index_cards_on_destination_id"

  create_table "comments", :force => true do |t|
    t.text     "body",       :default => "", :null => false
    t.integer  "card_id",                    :null => false
    t.integer  "member_id",                  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "comments", ["card_id"], :name => "index_comments_on_card_id"
  add_index "comments", ["member_id"], :name => "index_comments_on_member_id"

  create_table "destinations", :force => true do |t|
    t.string   "email",      :default => "", :null => false
    t.string   "name",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "image_url"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "replies", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.text     "body",       :default => "", :null => false
    t.integer  "card_id",                    :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "replies", ["card_id"], :name => "index_replies_on_card_id"

end
