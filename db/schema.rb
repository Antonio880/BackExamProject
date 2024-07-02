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

ActiveRecord::Schema[7.1].define(version: 2024_07_02_212952) do
  create_table "exam_questions", force: :cascade do |t|
    t.integer "exam_id", null: false
    t.string "question"
    t.string "description"
    t.json "answers"
    t.json "correct_answers"
    t.string "multiple_correct_answers"
    t.string "correct_answer"
    t.string "explanation"
    t.string "tip"
    t.string "category"
    t.string "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_questions_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "category"
    t.integer "question_count"
    t.integer "created_by_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_exams_on_created_by_id"
    t.index ["room_id"], name: "index_exams_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "serie", null: false
    t.string "curso", null: false
    t.integer "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_rooms_on_created_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "role"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_users_on_room_id"
  end

  add_foreign_key "exam_questions", "exams"
  add_foreign_key "exams", "rooms"
  add_foreign_key "exams", "users", column: "created_by_id"
  add_foreign_key "rooms", "users", column: "created_by_id"
  add_foreign_key "users", "rooms"
end
