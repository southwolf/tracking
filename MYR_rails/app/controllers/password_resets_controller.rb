class PasswordResetsController < ApplicationController

  def new

  end
	

  def edit
  end
  
  def create
    @member = Member.find_by(email: params[:password_reset][:email].downcase)
    if @member
      @member.create_reset_digest
      @member.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to '/password_resets/sent_password_reset_email'
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end
  
  def sent_password_reset_email
  end
  
end