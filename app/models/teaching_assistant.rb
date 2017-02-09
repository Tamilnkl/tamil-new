class TeachingAssistant < ActiveRecord::Base
   belongs_to :ta_duty, polymorphic: true
  attr_accessible :name, :ta_duty_id, :ta_duty_type
end
