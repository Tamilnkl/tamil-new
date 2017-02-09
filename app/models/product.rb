class Product < ActiveRecord::Base
  #acts_as_tree
 has_many :invoices
  has_one :image, as: :imagable
  attr_accessible :text, :text_area, :text_field, :title
  attr_accessor :name
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def all_themes
   Invoice.where(:product_id => "12")
  end

end
