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

ActiveRecord::Schema.define(version: 20161122183806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",                    null: false
    t.string   "source_name",              null: false
    t.date     "date",                     null: false
    t.string   "author",                   null: false
    t.string   "image_url",                null: false
    t.string   "article_url",              null: false
    t.text     "description",              null: false
    t.text     "keywords",    default: [],              array: true
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["date"], name: "index_articles_on_date", using: :btree
    t.index ["source_name"], name: "index_articles_on_source_name", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "first_article_id",  null: false
    t.integer  "second_article_id", null: false
    t.integer  "score",             null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["first_article_id", "second_article_id"], name: "index_matches_on_first_article_id_and_second_article_id", using: :btree
    t.index ["second_article_id"], name: "index_matches_on_second_article_id", using: :btree
  end

  create_table "sources", force: :cascade do |t|
    t.string   "private_name", null: false
    t.string   "public_name",  null: false
    t.integer  "score",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["private_name"], name: "index_sources_on_private_name", unique: true, using: :btree
    t.index ["public_name"], name: "index_sources_on_public_name", unique: true, using: :btree
  end

end
