class ChangePlayerUserNameStringToUserName < ActiveRecord::Migration[5.1]
  def change
    remove_column :player_profiles, :pla_pro_user_name_string
    add_column :player_profiles, :pla_pro_user_name, :string
  end
end
