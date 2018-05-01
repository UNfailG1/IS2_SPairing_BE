class GameSimpleSerializer < ActiveModel::Serializer
  attributes :id, :gam_name, :gam_description, :gam_link, :gam_image, :gam_user_counter, :gam_views
end
