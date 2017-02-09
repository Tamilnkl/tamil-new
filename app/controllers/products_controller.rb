class ProductsController < ApplicationController
  def index
   #$ debugger
    #@q = Product.ransack(params[:q])
    @product = Product.all
   #render "search"
  end
  
  def new
    @product = Product.new
  end
  def create
  @product = Product.new(params[:product])
  @product.save
  @Image = Image.new(:entity_id =>@product.id,:user_id=>@user.id, :entity_type => "Product")
  @Image.save
  redirect_to @product
end
def update
  @product = Product.find(params[:id])
  if @product.update_attributes(params[:product]) 
    render 'show'
  else
    render 'edit'
  end
  
 end
 def edit
    @product = Product.find(params[:id])
 end
def show
    @product = Product.find(params[:id])
  end
  def destroy
     @product = Product.find(params[:id])
     @product.destroy
    redirect_to :back
  end
  
  def product_regenerate_price 
    product = Product.find(params[:product_id])
   render :json => {:id => product.title,:price=>product.text}   
  end
  
end
