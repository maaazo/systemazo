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

ActiveRecord::Schema[7.1].define(version: 2024_03_08_184513) do
  create_table "appointments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.datetime "appointment_time", null: false
    t.string "status"
    t.integer "duration", limit: 4
    t.float "price", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_appointments_on_company_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "client_intake_forms", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "preferred_name"
    t.string "email_address"
    t.string "gender"
    t.string "phone_number"
    t.date "date_of_birth"
    t.string "address"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "alternate_phone_number"
    t.text "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_client_intake_forms_on_company_id"
    t.index ["user_id"], name: "index_client_intake_forms_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employment_application_forms", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "user_id", null: false
    t.boolean "company_owner"
    t.string "preferred_name"
    t.string "gender"
    t.string "alternate_phone_number"
    t.text "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employment_application_forms_on_company_id"
    t.index ["user_id"], name: "index_employment_application_forms_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_memberships_on_company_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "status"
    t.string "verification_status"
    t.datetime "last_login"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "companies"
  add_foreign_key "appointments", "users"
  add_foreign_key "client_intake_forms", "companies"
  add_foreign_key "client_intake_forms", "users"
  add_foreign_key "employment_application_forms", "companies"
  add_foreign_key "employment_application_forms", "users"
  add_foreign_key "memberships", "companies"
  add_foreign_key "memberships", "users"
end
