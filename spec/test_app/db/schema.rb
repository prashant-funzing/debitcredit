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

ActiveRecord::Schema.define(version: 2015_01_06_165647) do

  create_table "debitcredit_accounts", force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "type", limit: 32, null: false
    t.integer "reference_id"
    t.string "reference_type", limit: 32
    t.decimal "balance", precision: 20, scale: 2, default: "0.0", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "overdraft_enabled", default: false, null: false
    t.index ["name", "reference_id", "reference_type"], name: "uindex", unique: true
  end

  create_table "debitcredit_entries", force: :cascade do |t|
    t.integer "reference_id"
    t.string "reference_type", limit: 32
    t.string "kind"
    t.string "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "parent_entry_id"
    t.integer "inverse_entry_id"
    t.index ["parent_entry_id"], name: "index_debitcredit_entries_on_parent_entry_id"
    t.index ["reference_id", "reference_type", "id"], name: "rindex"
  end

  create_table "debitcredit_items", force: :cascade do |t|
    t.integer "entry_id", null: false
    t.integer "account_id", null: false
    t.boolean "debit", null: false
    t.string "comment"
    t.decimal "amount", precision: 20, scale: 2, default: "0.0", null: false
    t.decimal "balance", precision: 20, scale: 2, default: "0.0", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id"], name: "index_debitcredit_items_on_account_id"
    t.index ["entry_id"], name: "index_debitcredit_items_on_entry_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
