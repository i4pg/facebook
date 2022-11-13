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

ActiveRecord::Schema[7.0].define(version: 2022_11_13_101041) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.text "body"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.bigint "requestor_id", null: false
    t.bigint "recevier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recevier_id"], name: "index_friend_requests_on_recevier_id"
    t.index ["requestor_id"], name: "index_friend_requests_on_requestor_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "requestor_user_id", null: false
    t.bigint "receiver_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_user_id"], name: "index_friends_on_receiver_user_id"
    t.index ["requestor_user_id"], name: "index_friends_on_requestor_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "friend_requests", "users", column: "recevier_id"
  add_foreign_key "friend_requests", "users", column: "requestor_id"
  add_foreign_key "friends", "users", column: "receiver_user_id"
  add_foreign_key "friends", "users", column: "requestor_user_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
end
