class InvoicesController < ApplicationController
  def index
    @invoice = Invoice.all
  end
  def new
    @invoice = Invoice.new
  end
 def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.save 
    #debugger
  #  @user = current_user
    @Image = Image.new(:entity_id =>@invoice.id,:entity_type => "Invoice")
    @Image.save  
   redirect_to @invoice
   #debugger
   #@user= User.find(params[:id])
   
      # UserNotifier.send_signup_email(@user).deliver
      
  end
  #def create
  #@invoice = Invoice.new(params[:invoice])
   # respond_to do |format|
    #  if @invoice.save
    #    format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
    #    format.json { render :show, status: :created, location: @invoice }
   #   else
   #     format.html { render :new }
    #    format.json { render json: @invoice.errors, status: :unprocessable_entity }
   #   end
   # end
 # end
  
  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update_attributes(params[:invoice])
      render 'show'
    else
      render 'edit'
    end
  end
  def edit
    @invoice = Invoice.find(params[:id])
  end
  def show
   # @invoice = Invoice.all
    @invoice = Invoice.find(params[:id])
  end
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to :back
  end
end