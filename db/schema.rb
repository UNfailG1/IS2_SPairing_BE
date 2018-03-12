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

ActiveRecord::Schema.define(version: 20180312200516) do

  create_table "ads", force: :cascade do |t|
    t.string "ad_description"
    t.string "ad_link"
    t.string "ad_image_path"
    t.integer "Sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Sponsor_id"], name: "index_ads_on_Sponsor_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "att_name"
    t.decimal "att_size"
    t.string "att_location_path"
    t.integer "Comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Comment_id"], name: "index_attachments_on_Comment_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "com_com"
    t.integer "Thread_id"
    t.integer "SubForum_id"
    t.integer "Game_id"
    t.integer "PlayerProfile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Game_id"], name: "index_comments_on_Game_id"
    t.index ["PlayerProfile_id"], name: "index_comments_on_PlayerProfile_id"
    t.index ["SubForum_id"], name: "index_comments_on_SubForum_id"
    t.index ["Thread_id"], name: "index_comments_on_Thread_id"
  end

  create_table "game_platforms", force: :cascade do |t|
    t.integer "Platform_id"
    t.integer "Game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Game_id"], name: "index_game_platforms_on_Game_id"
    t.index ["Platform_id"], name: "index_game_platforms_on_Platform_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "gam_name"
    t.string "gam_description"
    t.string "gam_link"
    t.integer "Pegi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Pegi_id"], name: "index_games_on_Pegi_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "PlayerProfile_id"
    t.integer "Game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Game_id"], name: "index_player_game_profiles_on_Game_id"
    t.index ["PlayerProfile_id"], name: "index_player_game_profiles_on_PlayerProfile_id"
  end

  create_table "player_profiles", force: :cascade do |t|
    t.string "pla_pro_real_name"
    t.string "pla_pro_user_name_string"
    t.string "pla_pro_password"
    t.string "pla_pro_email"
    t.float "pla_sparing_elo"
    t.integer "Location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Location_id"], name: "index_player_profiles_on_Location_id"
  end

  create_table "player_white_lists", force: :cascade do |t|
    t.integer "pla_whie_list_p1_id"
    t.integer "pla_whie_list_p2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pla_whie_list_p1_id"], name: "index_player_white_lists_on_pla_whie_list_p1_id"
    t.index ["pla_whie_list_p2_id"], name: "index_player_white_lists_on_pla_whie_list_p2_id"
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
    t.integer "Game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Game_id"], name: "index_sub_forums_on_Game_id"
  end

  create_table "thread_forums", force: :cascade do |t|
    t.string "thr_name"
    t.integer "thr_views"
    t.integer "thr_number_comments"
    t.integer "SubForum_id"
    t.integer "Game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Game_id"], name: "index_thread_forums_on_Game_id"
    t.index ["SubForum_id"], name: "index_thread_forums_on_SubForum_id"
  end

end
