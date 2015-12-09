class LineListsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

	def index
  		respond_to do |format|
    	format.html
    	format.json { render json: LineListsDatatable.new(view_context) }
  	end

	def new
  		@line_list = LineList.new
  	end

  	def create
  		@line_list = LineList.new(line_list_params)
  		if @line_list.save
  			redirect_to line_lists_path
  		else
  			render 'new'	
  		end
  	end

  	def destroy
  		LineList.find(params[:line_id]).destroy
  	end

  	private
	  	def line_list_params
	  		params.require(:line_list).permit(:group_number, :day, :linename, :line_info, :travel_content, :picture_id, :document_id, :price, :record_person, :selling_ornot)
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
