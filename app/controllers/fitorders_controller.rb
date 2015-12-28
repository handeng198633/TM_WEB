class FitordersController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

	def index
  		respond_to do |format|
    	format.html
    	format.json { render json: FitordersDatatable.new(view_context) }
  	  end
  end

	def new
  		@fitorder = Fitorder.new
  	end

  	def create
  		@fitorder = Fitorder.new(fitorder_params)
      @fitorder.recipient = current_user.name
  		if @fitorder.save
  			redirect_to fitorders_path
  		else
  			render 'new'	
  		end
  	end

  	def destroy
  		Fitorder.find(params[:id]).destroy
      redirect_to fitorders_path
  	end

  	private
	  	def fitorder_params
	  		params.require(:fitorder).permit(:group_number, :outdate, :returndate, :bookinfo, :info, :persons_list, :comeinfo, :comeinfo_way, :goinfo, :goinfo_way, :price1, :price2, :price3, :price4, :customers_info, :tip, :recipient, :current_collction, :status)
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
