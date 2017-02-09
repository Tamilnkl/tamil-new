class User < ActiveRecord::Base
  has_many :articles
  has_many :text
  has_one :image, as: :imagable
  attr_accessible :address, :email, :fullname, :name, :password, :phone, :user_type
  has_many :subordinates, class_name: "User",foreign_key: "manager_id"
  belongs_to :manager, class_name: "User"
  validate :password
 # def password
    #unless self.email.blank?
    #validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "is not valid"
   # end
  # errors[:base] << ("Email address should not be blank") if self.email.blank?
   #errors[:base] << ("Phone number should not be blank") if self.phone.blank?
    #errors[:base] << ("First Name should not be blank") if self.firstname.blank?
   # errors[:base] << ("Last Name should not be blank") if self.lastname.blank?
  # errors[:base] << ("Password should not be blank") if self.password.blank?
    #errors[:base] << ("User type does not match") unless  (self.user_type == "agent" || self.user_type == "customer" || self.user_type == "Admin" || self.user_type == "support")
  #end
  after_create do |user|
    user.user_type = Digest::MD5.hexdigest(Time.now.to_s+'CRM')
    user.save
  end
end
