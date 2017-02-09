class Appointment < ActiveRecord::Base
  attr_accessible :name, :phone
  belongs_to :Template
  belongs_to :Theme
end
