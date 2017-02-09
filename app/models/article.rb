class Article < ActiveRecord::Base
  attr_accessible :blob, :description, :title
  belongs_to :user
end
