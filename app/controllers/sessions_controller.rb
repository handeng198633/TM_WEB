class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(name: params[:session][:name])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		redirect_to root_url
#     redirect_back_or user
  	else
  		flash[:error] = '用户名/密码错误！'
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
