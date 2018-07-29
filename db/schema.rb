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

ActiveRecord::Schema.define(version: 2018_07_29_081725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "value", null: false
    t.string "created_by", null: false
    t.string "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "choices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "description"
    t.string "created_by", null: false
    t.string "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_courses_on_code", unique: true
  end

  create_table "question_contents", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.integer "status", default: 0, null: false
    t.text "markdown"
    t.string "created_by", null: false
    t.string "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_contents_on_question_id"
    t.index ["status"], name: "index_question_contents_on_status"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "subtopic_id", null: false
    t.bigint "author_id", null: false
    t.integer "status", default: 0, null: false
    t.string "created_by", null: false
    t.string "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topic_id", null: false
    t.bigint "course_id", null: false
    t.index ["author_id"], name: "index_questions_on_author_id"
    t.index ["course_id"], name: "index_questions_on_course_id"
    t.index ["status"], name: "index_questions_on_status"
    t.index ["subtopic_id"], name: "index_questions_on_subtopic_id"
    t.index ["topic_id"], name: "index_questions_on_topic_id"
  end

  create_table "session_question_answers", force: :cascade do |t|
    t.bigint "session_question_id", null: false
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_question_id"], name: "index_session_question_answers_on_session_question_id"
  end

  create_table "session_questions", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "session_id"], name: "index_session_questions_on_question_id_and_session_id", unique: true
    t.index ["question_id"], name: "index_session_questions_on_question_id"
    t.index ["session_id"], name: "index_session_questions_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.datetime "start", null: false
    t.datetime "end"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_sessions_on_student_id"
  end

  create_table "subtopics", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.string "code", null: false
    t.string "name", null: false
    t.string "description"
    t.string "created_by", null: false
    t.string "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_subtopics_on_code"
    t.index ["topic_id", "code"], name: "index_subtopics_on_topic_id_and_code", unique: true
    t.index ["topic_id"], name: "index_subtopics_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "code", null: false
    t.string "name", null: false
    t.string "description"
    t.string "created_by", null: false
    t.string "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_topics_on_code"
    t.index ["course_id", "code"], name: "index_topics_on_course_id_and_code", unique: true
    t.index ["course_id"], name: "index_topics_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "password_digest", null: false
    t.string "created_by", null: false
    t.string "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "questions", "users", column: "author_id"
  add_foreign_key "sessions", "users", column: "student_id"
end
