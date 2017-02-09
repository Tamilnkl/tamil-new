class UsersController < ApplicationController
  #before_filter :authenticate_user!
  
 def index
    @user = User.all
  end
    def new
    @user = User.new
  end
  def create
  @user = User.new(params[:user])
  @user.save
   @Image = Image.new(:entity_id =>@user.id,:user_id => @user.id,:entity_type => "User")
    @Image.save
  redirect_to @user
end
def show
  
  @user = User.find(params[:id])
end
def edit
  @user = User.find(params[:id])
end
def update
  debugger
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    render 'show'
  else
    render 'edit'
  end 
end
def destroy
  @user= User.find(params[:id])
  @user.destroy
  redirect_to :back
end


end
