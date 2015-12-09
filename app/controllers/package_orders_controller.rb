class PackageOrdersController < ApplicationController
	before_action :signed_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

	def index
  		respond_to do |format|
    	format.html
    	format.json { render json: PackageOrdersDatatable.new(view_context) }
  	end

	def new
  		@package_order = PackageOrder.new
  	end

  	def create
  		@package_order = PackageOrder.new(package_order_params)
  		if @package_order.save
  			redirect_to package_orders_path
  		else
  			render 'new'	
  		end
  	end

  	def destroy
  		PackageOrder.find(params[:order_id]).destroy
  	end


  	private
	  	def package_order_params
	  		params.require(:package_order).permit(:group_number, :outdate, :returndate, :travel_agency, :person_list, :travel_content, :price1, :price2, :price3, :price4, :out_tracffic, :return_tracffic, :cost, :package_ornot, :sales)
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
