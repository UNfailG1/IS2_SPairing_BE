class AddAvatarToPlayerProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :player_profiles, :pp_avatar, :string
  end
end
