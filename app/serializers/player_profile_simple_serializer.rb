class PlayerProfileSimpleSerializer < ActiveModel::Serializer
  attributes :id, :pp_username, :email, :pp_spairing_elo, :pp_avatar
end
