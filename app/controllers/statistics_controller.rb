class StatisticsController < ApplicationController

  def index
    @querie =
    {usage:
      {
        thr_most_commented:     "Returns the most commented threads of a game, sub forum or for every comments",
        gam_most_played:        "Returns the most popular games",
        users_register_record:  "Returns the count of players registered on a intervale of time",
        mails_per_day:          "Returns the count of mails sent on a given day",
        genre_most_wanted:      "Returns the most wanted genres",
        best_players:           "Returns the best players on the platform"
      }
    }
    render json: @querie, status: 422
  end

  def show
    @action = params["id"]
    case @action
    when "thr_most_commented"
      thr_most_commented(params["sub_forum"], params["game"])
    when "gam_most_played"
      gam_most_played
    when "users_register_record"

    when "mails_per_day"
      puts "TODO"
    when "genre_most_wanted"
      puts "TODO"
    when "best_players"
      puts "TODO"
    else
      index
    end
  end

  private
  def thr_most_commented(sub_forum, game)
    @querie = []
    if sub_forum == nil && game == nil
      @querie = ThreadForum.getMostCommentedThreads
    elsif sub_forum != nil && game != nil
      @querie = {error: "Perform this get with only a game or a sub forum"}
      render json: @querie, status: 422
      return
    elsif sub_forum != nil
      @querie = SubForum.find(sub_forum).getMostCommentedThreads
    else
      @querie = Game.find(game).getMostCommentedThreads
    end
    render json: @querie, each_serializer: ThreadForumSimpleSerializer
  end

  def gam_most_played
    @querie = Game.getMostPlayed
    render json: @querie, each_serializer: GameSimpleSerializer
  end

  def users_register_record
    
  end

end
