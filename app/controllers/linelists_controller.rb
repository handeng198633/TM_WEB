class LinelistsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
  before_action :admin_user, only: :destroy

	def index
  		respond_to do |format|
    	format.html
    	format.json { render json: LinelistsDatatable.new(view_context) }
    	end
  	end

	def new
  		@linelist = Linelist.new
  end

  	def create
  		@linelist = Linelist.new(linelist_params)
      @linelist.record_person = current_user.name
  		if @linelist.save
  			redirect_to linelists_path
  		else
  			render 'new'	
  		end
  	end

  	def destroy
  		Linelist.find(params[:id]).destroy
      redirect_to linelists_path
  	end

  	private
	  	def linelist_params
	  		params.require(:linelist).permit(:group_number, :day, :linename, :line_info, :travel_content, :picture, :document, :price, :record_person, :selling_ornot)
	  	end

	    def logged_in_user
	      unless logged_in?
	        store_location
	        flash[:danger] = "请先登录!"
	        redirect_to login_url
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
