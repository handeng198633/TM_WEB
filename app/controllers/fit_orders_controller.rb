class FitOrdersController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

	def index
  		respond_to do |format|
    	format.html
    	format.json { render json: FitOrdersDatatable.new(view_context) }
  	  end
  end

	def new
  		@fit_order = FitOrder.new
  	end

  	def create
  		@fit_order = FitOrder.new(fit_order_params)
  		if @fit_order.save
  			redirect_to fit_orders_path
  		else
  			render 'new'	
  		end
  	end

  	def destroy
  		FitOrder.find(params[:order_id]).destroy
  	end

  	private
	  	def fit_order_params
	  		params.require(:fit_order).permit(:group_number, :outdate, :returndate, :bookinfo, :info, :persons_list, :comeinfo, :goinfo,:price1, :price2, :price3, :price4, :customers_info, :tip, :recipient, :current_collction, :status)
	  	end

	    def correct_user
	      @user = User.find(params[:id])
	      redirect_to(root_url) unless current_user?(@user)
	    end

	    def admin_user
	      redirect_to{roo_url} unless current_user.admin?
	    end
	end
end
