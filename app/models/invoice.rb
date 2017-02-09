class Invoice < ActiveRecord::Base
 # acts_as_tree
  has_many :product
  has_one :image, as: :imagable
  validates_length_of :phone, :minimum => 3, :maximum => 10
  attr_accessible :name, :phone
  
  
end
