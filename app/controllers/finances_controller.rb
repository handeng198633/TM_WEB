class FinancesController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

  	def index
    		respond_to do |format|
      	format.html {}
      	format.json { render json: FinancesDatatable.new(view_context) }
        end
    end

    	def new
      		@finance = Finance.new
      end

    	def create
    		@finance = Finance.new(finance_params)
        @finance.balance = @finance.should - @finance.received
    		if @finance.save
    			redirect_to finances_path
    		else
    			render 'new'	
    		end
    	end

    	def destroy
    		Finance.find(params[:id]).destroy
        	redirect_to finances_path
    	end


    	private

  	  	def finance_params
  	  		params.require(:finance).permit(:out_date, :package_date, :content, :travel_agency, :person_number, :price4_person, :should, :received, :remark )
  	  	end

  	    def correct_user
  	      @user = User.find(params[:id])
  	      redirect_to(root_url) unless current_user?(@user)
  	    end

  	    def admin_user
  	      redirect_to{roo_url} unless current_user.admin?
  	    end
end
