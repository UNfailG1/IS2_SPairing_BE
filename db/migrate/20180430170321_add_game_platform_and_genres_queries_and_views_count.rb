class AddGamePlatformAndGenresQueriesAndViewsCount < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :gam_views, :integer
    add_column :platforms, :plat_views, :integer
    add_column :genres, :gen_views, :integer
  end
end
