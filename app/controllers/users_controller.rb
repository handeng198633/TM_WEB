class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
  	@user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 8)
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] = @user.name + '创建成功'
      render root_url
  	else
  		render 'new'
  	end
    if @user.id == 1 && @user.id == 2
      @user.update_attribute(:admin, true)
      @user.save
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "编辑成功"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "删除用户成功！"
    redirect_to users_url
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :contact_info, :password, :password_confirmation)
  	end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "请先登录!"
        redirect_to root_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to{roo_url} unless current_user.admin?
    end

end
