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

ActiveRecord::Schema.define(version: 20180511221133) do

  create_table "ads", force: :cascade do |t|
    t.text "ad_description"
    t.string "ad_link"
    t.string "ad_image"
    t.integer "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sponsor_id"], name: "index_ads_on_sponsor_id"
  end

  create_table "blocked_players", id: false, force: :cascade do |t|
    t.integer "player_profile_id"
    t.integer "blocked_player_profile_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "thread_forum_id"
    t.integer "player_profile_id"
    t.string "com_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_profile_id"], name: "index_comments_on_player_profile_id"
    t.index ["thread_forum_id"], name: "index_comments_on_thread_forum_id"
  end

  create_table "friends", id: false, force: :cascade do |t|
    t.integer "player_profile_id"
    t.integer "friend_player_profile_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "gam_name"
    t.text "gam_description"
    t.string "gam_link"
    t.string "gam_image"
    t.integer "gam_user_counter"
    t.integer "gam_views"
    t.decimal "gam_rate_igdb"
    t.decimal "gam_rate_players"
    t.integer "pegi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pegi_id"], name: "index_games_on_pegi_id"
  end

  create_table "games_genres", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "genre_id"
    t.index ["game_id"], name: "index_games_genres_on_game_id"
    t.index ["genre_id"], name: "index_games_genres_on_genre_id"
  end

  create_table "games_platforms", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "platform_id"
    t.index ["game_id"], name: "index_games_platforms_on_game_id"
    t.index ["platform_id"], name: "index_games_platforms_on_platform_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "gen_name"
    t.integer "gen_views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "loc_lat"
    t.decimal "loc_long"
    t.string "loc_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxes", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "mail_subject"
    t.text "mail_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pegis", force: :cascade do |t|
    t.string "peg_name"
    t.integer "peg_age"
    t.string "peg_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "plat_name"
    t.string "plat_link"
    t.integer "plat_views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_game_profiles", force: :cascade do |t|
    t.float "pgp_reputation"
    t.string "pgp_nickname"
    t.float "pgp_rate"
    t.integer "game_id"
    t.integer "player_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_player_game_profiles_on_game_id"
    t.index ["player_profile_id"], name: "index_player_game_profiles_on_player_profile_id"
  end

  create_table "player_profiles", force: :cascade do |t|
    t.string "pp_username"
    t.string "password_digest"
    t.string "email"
    t.float "pp_spairing_elo"
    t.string "pp_avatar"
    t.string "pp_googleId"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_player_profiles_on_location_id"
  end

  create_table "player_reports", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.text "pr_reasons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "report_type"
    t.string "filename"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "spo_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_forums", force: :cascade do |t|
    t.string "sf_name"
    t.text "sf_description"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_sub_forums_on_game_id"
  end

  create_table "tag_players", id: false, force: :cascade do |t|
    t.integer "player_game_profile_id"
    t.integer "tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thread_forums", force: :cascade do |t|
    t.string "thr_name"
    t.integer "thr_views"
    t.integer "thr_comments"
    t.integer "sub_forum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_forum_id"], name: "index_thread_forums_on_sub_forum_id"
  end

end
