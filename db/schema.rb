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

ActiveRecord::Schema.define(version: 20150508051746) do

  create_table "accounts", force: :cascade do |t|
    t.decimal  "balance"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accounts", ["client_id"], name: "index_accounts_on_client_id"

  create_table "bank_accounts", force: :cascade do |t|
    t.decimal  "balance"
    t.string   "currency"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bank_accounts", ["client_id"], name: "index_bank_accounts_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debit_cards", force: :cascade do |t|
    t.string   "number"
    t.integer  "expiration_month"
    t.integer  "expiration_year"
    t.integer  "bank_account_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "debit_cards", ["bank_account_id"], name: "index_debit_cards_on_bank_account_id"

  create_table "transactions", force: :cascade do |t|
    t.string   "responsible"
    t.string   "label"
    t.decimal  "amount"
    t.integer  "bank_account_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "transactions", ["bank_account_id"], name: "index_transactions_on_bank_account_id"

end
