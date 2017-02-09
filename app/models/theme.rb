class Theme < ActiveRecord::Base
   has_many :appointments
  has_many :templates, through: :appointments
  attr_accessible :image_path, :name, :template_id
end
