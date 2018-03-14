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

ActiveRecord::Schema.define(version: 20180314025526) do

  create_table "ads", force: :cascade do |t|
    t.string "ad_description"
    t.string "ad_link"
    t.string "ad_image_path"
    t.integer "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sponsor_id"], name: "index_ads_on_sponsor_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "att_name"
    t.decimal "att_size"
    t.string "att_location_path"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_attachments_on_comment_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "com_com"
    t.integer "thread_id"
    t.integer "sub_forum_id"
    t.integer "game_id"
    t.integer "player_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_comments_on_game_id"
    t.index ["player_profile_id"], name: "index_comments_on_player_profile_id"
    t.index ["sub_forum_id"], name: "index_comments_on_sub_forum_id"
    t.index ["thread_id"], name: "index_comments_on_thread_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "gam_name"
    t.string "gam_description"
    t.string "gam_link"
    t.integer "pegi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pegi_id"], name: "index_games_on_pegi_id"
  end

  create_table "games_genres", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_games_genres_on_game_id"
    t.index ["genre_id"], name: "index_games_genres_on_genre_id"
  end

  create_table "games_platforms", force: :cascade do |t|
    t.integer "platform_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_games_platforms_on_game_id"
    t.index ["platform_id"], name: "index_games_platforms_on_platform_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "gen_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "loc_lat"
    t.decimal "loc_lon"
    t.string "loc_name"
    t.integer "player_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_profile_id"], name: "index_locations_on_player_profile_id"
  end

  create_table "mailboxes", force: :cascade do |t|
    t.integer "mail_sender_id"
    t.integer "mail_recever_id"
    t.string "mail_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mail_recever_id"], name: "index_mailboxes_on_mail_recever_id"
    t.index ["mail_sender_id"], name: "index_mailboxes_on_mail_sender_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_black_lists", force: :cascade do |t|
    t.integer "blocker_id"
    t.integer "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked_id"], name: "index_player_black_lists_on_blocked_id"
    t.index ["blocker_id"], name: "index_player_black_lists_on_blocker_id"
  end

  create_table "player_game_profiles", force: :cascade do |t|
    t.decimal "player_reputation"
    t.string "player_nickname"
    t.decimal "player_game_rate"
    t.integer "player_profile_id"
    t.integer "dame_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dame_id"], name: "index_player_game_profiles_on_dame_id"
    t.index ["player_profile_id"], name: "index_player_game_profiles_on_player_profile_id"
  end

  create_table "player_profiles", force: :cascade do |t|
    t.string "pla_pro_real_name"
    t.string "pla_pro_password"
    t.string "pla_pro_email"
    t.float "pla_sparing_elo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pla_pro_user_name"
  end

  create_table "player_white_lists", force: :cascade do |t|
    t.integer "player_friend_sender_id"
    t.integer "player_friend_recever_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_friend_recever_id"], name: "index_player_white_lists_on_player_friend_recever_id"
    t.index ["player_friend_sender_id"], name: "index_player_white_lists_on_player_friend_sender_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rat_rater_id"
    t.integer "rat_recever_id"
    t.float "rat_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rat_rater_id"], name: "index_ratings_on_rat_rater_id"
    t.index ["rat_recever_id"], name: "index_ratings_on_rat_recever_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "spo_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_forums", force: :cascade do |t|
    t.string "sub_for_name"
    t.string "sub_for_description"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_sub_forums_on_game_id"
  end

  create_table "thread_forums", force: :cascade do |t|
    t.string "thr_name"
    t.integer "thr_views"
    t.integer "thr_number_comments"
    t.integer "sub_forum_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_thread_forums_on_game_id"
    t.index ["sub_forum_id"], name: "index_thread_forums_on_sub_forum_id"
  end

end
