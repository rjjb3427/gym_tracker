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

ActiveRecord::Schema.define(:version => 20130208081427) do

  create_table "diets", :force => true do |t|
    t.boolean  "active"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  add_index "diets", ["profile_id"], :name => "index_diets_on_profile_id"

  create_table "food_line_items", :force => true do |t|
    t.integer  "diet_id"
    t.integer  "food_id"
    t.float    "amount"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "measure_unit_id"
  end

  add_index "food_line_items", ["diet_id"], :name => "index_food_line_items_on_diet_id"
  add_index "food_line_items", ["food_id"], :name => "index_food_line_items_on_food_id"

  create_table "foods", :force => true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "foods", ["type_id"], :name => "index_foods_on_type_id"

  create_table "measure_units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nutritional_informations", :force => true do |t|
    t.integer  "food_id"
    t.float    "energy"
    t.float    "proteins"
    t.float    "fat"
    t.float    "hydrates"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "nutritional_informations", ["food_id"], :name => "index_nutritional_informations_on_food_id"

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.float    "weight"
    t.float    "height"
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
  end

  add_index "profiles", ["email"], :name => "index_profiles_on_email", :unique => true
  add_index "profiles", ["reset_password_token"], :name => "index_profiles_on_reset_password_token", :unique => true

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
