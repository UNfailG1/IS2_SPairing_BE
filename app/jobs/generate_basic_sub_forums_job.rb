class GenerateBasicSubForumsJob < ApplicationJob
  queue_as :default

  def perform(game)
    SubForum.create(sf_name: "Random stuff",
      sf_description: "A place where you can say whatever about " + game.gam_name, game_id: game.id)
    SubForum.create(sf_name: "Tricks and guides",
      sf_description: "A place where you can share your tricks and guides on " + game.gam_name, game_id: game.id)
    SubForum.create(sf_name: "Reviews",
      sf_description: "A place where you can share your analysis of " + game.gam_name, game_id: game.id)
    SubForum.create(sf_name: "News",
      sf_description: "A place where you'll see recient news about " + game.gam_name, game_id: game.id)
  end

end
