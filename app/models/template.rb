class Template < ActiveRecord::Base
  has_many :appointments
   has_many :themes, through: :appointments
  attr_accessible :entity_type, :name, :theme
  
  
 # def all_themes
   # Theme.where(:template_id => self.id)
 # end
end
