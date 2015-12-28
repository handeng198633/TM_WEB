class NetprofitsController < ApplicationController
  	before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

  	def index
    	respond_to do |format|
      	format.html {}
      	format.json { render json: NetprofitsDatatable.new(view_context) }
        end
    end

    	def new
      		@netprofit = Netprofit.new
      end

    	def create
    		@netprofit = Netprofit.new(netprofit_params)
    		if @netprofit.save
    			redirect_to netprofits_path
    		else
    			render 'new'	
    		end
    	end

    	def destroy
    		netprofit.find(params[:id]).destroy
    		redirect_to netprofits_path
    	end


    	private

  	  	def netprofit_params
  	  		params.require(:netprofit).permit(:month, :profit, :fax, :net_profit, :status)
  	  	end

  	    def correct_user
  	      @user = User.find(params[:id])
  	      redirect_to(root_url) unless current_user?(@user)
  	    end

  	    def admin_user
  	      redirect_to{roo_url} unless current_user.admin?
  	    end
end
