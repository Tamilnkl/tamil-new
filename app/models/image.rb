class Image < ActiveRecord::Base
  belongs_to :imagable, polymorphic: true
  attr_accessible :entity_id, :entity_type, :image_file_name, :image_file_size, :user_id
end
