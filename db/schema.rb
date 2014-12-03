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

ActiveRecord::Schema.define(version: 20141203203549) do

  create_table "actors", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artist_movies", force: true do |t|
    t.integer  "artist_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", force: true do |t|
    t.text     "name"
    t.text     "rt_artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: true do |t|
    t.integer  "artist_id"
    t.integer  "movie_id"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "directors", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.text     "rt_id"
    t.text     "title"
    t.integer  "year"
    t.text     "mpaa_rating"
    t.integer  "runtime"
    t.text     "critics_consensus"
    t.datetime "release_theater"
    t.datetime "release_dvd"
    t.text     "critics_rating"
    t.integer  "critics_score"
    t.text     "audience_rating"
    t.integer  "audience_score"
    t.text     "synopsis"
    t.text     "poster_url"
    t.text     "imdb"
    t.text     "rt_url"
    t.text     "cast_url"
    t.text     "review_url"
    t.text     "similar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "omdb_actors", force: true do |t|
    t.integer  "actor_id"
    t.integer  "omdb_movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "omdb_directors", force: true do |t|
    t.integer  "director_id"
    t.integer  "omdb_movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "omdb_genres", force: true do |t|
    t.integer  "genre_id"
    t.integer  "omdb_movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "omdb_movies", force: true do |t|
    t.text     "imdb"
    t.text     "title"
    t.integer  "year"
    t.text     "rated"
    t.datetime "released"
    t.integer  "runtime"
    t.text     "plot"
    t.text     "language"
    t.text     "country"
    t.text     "awards"
    t.text     "poster"
    t.integer  "metascore"
    t.float    "imdb_rating"
    t.integer  "imdb_votes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "omdb_writers", force: true do |t|
    t.integer  "writer_id"
    t.integer  "omdb_movie_id"
    t.text     "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "writers", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
