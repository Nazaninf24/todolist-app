class EmailsController < ApplicationController
  
  def new
  end

  def create
     @email = Email.new(object: Faker::Book.genre, body: Faker::Book.genre)
    if @email.save
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js { }
        end
      # flash[:notice] = "Email created"
    else
      respond_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def show
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    @email.status = !@email.status
    @email.update(email_params)
    respond_to do |format|
          format.html { redirect_to root_path }
          format.js { }
    end
    flash[:notice] = "Email edited"
  end

  def index
    @emails = Email.all
  end

  def destroy
    @email = email.find(params[:id])
    @email.destroy
    respond_to do |format|
          format.html { redirect_to root_path }
          format.js { }
    end
  end

  private
  def email_params
    params.permit(:object, :body)
  end
end




