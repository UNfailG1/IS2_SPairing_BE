class CreatePlayerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :player_profiles do |t|
      t.string :pla_pro_real_name
      t.string :pla_pro_user_name_string
      t.string :pla_pro_password
      t.string :pla_pro_email
      t.float :pla_sparing_elo
      
      t.timestamps
    end
  end
end
