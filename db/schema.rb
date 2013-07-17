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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130717013953) do

  create_table "line_items", force: true do |t|
    t.integer  "quantity",   default: 1
    t.decimal  "price"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id"

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
