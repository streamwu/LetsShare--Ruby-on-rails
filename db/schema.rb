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

ActiveRecord::Schema.define(version: 20140315044828) do

  create_table "ablums", force: true do |t|
    t.string   "title"
    t.integer  "year"
    t.integer  "duration"
    t.string   "poster_url"
    t.integer  "rating_num",   default: 0
    t.integer  "rating_score", default: 0
    t.string   "source_url"
    t.integer  "singer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actors", force: true do |t|
    t.string   "name"
    t.string   "birthdate"
    t.string   "gender"
    t.string   "country"
    t.string   "photo_url"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actors_movies", id: false, force: true do |t|
    t.integer "actor_id"
    t.integer "movie_id"
  end

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "birthdate"
    t.string   "gender"
    t.string   "country"
    t.string   "photo_url"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beings", force: true do |t|
    t.integer  "beingable_id"
    t.string   "beingable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.integer  "year"
    t.integer  "pages",            default: 0
    t.string   "poster_url"
    t.text     "description"
    t.integer  "rating_num",       default: 0
    t.integer  "rating_score",     default: 0
    t.string   "source_url"
    t.text     "editorial_review"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diaries", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "directors", force: true do |t|
    t.string   "name"
    t.string   "birthdate"
    t.string   "gender"
    t.string   "country"
    t.string   "photo_url"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dones", force: true do |t|
    t.integer  "doneable_id"
    t.string   "doneable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "title"
    t.string   "photo_url"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "year"
    t.integer  "duration",         default: 0
    t.string   "poster_url"
    t.text     "plot"
    t.string   "trailer_url"
    t.integer  "rating_num",       default: 0
    t.integer  "rating_score",     default: 0
    t.string   "official_website"
    t.string   "video_url"
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pic_albums", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "cover"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "pic_url"
    t.text     "pic_comment"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "questionable_id"
    t.string   "questionable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.integer  "score"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", force: true do |t|
    t.text     "content"
    t.integer  "repliable_id"
    t.string   "repliable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "singers", force: true do |t|
    t.string   "name"
    t.string   "birthdate"
    t.string   "gender"
    t.string   "country"
    t.string   "photo_url"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "title"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", force: true do |t|
    t.integer  "todoable_id"
    t.string   "todoable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "photo_url",       default: "userDefault.jpg"
    t.string   "locations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
