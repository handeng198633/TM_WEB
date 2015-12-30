class SalescountsController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

  	def index
    		respond_to do |format|
      	format.html {}
      	format.json { render json: SalescountsDatatable.new(view_context) }
        end
    end

    	def new
      		@salescount = Salescount.new
      end

    	def create
    		@salescount = Salescount.new(salescount_params)
        @salescount.sales = current_user.name
    		if @salescount.save
    			redirect_to salescounts_path
    		else
    			render 'new'	
    		end
    	end

    	def destroy
    		salescount.find(params[:id]).destroy
        redirect_to salescounts_path
    	end


    	private

  	  	def salescount_params
  	  		params.require(:salescount).permit(:name)
  	  	end

  	    def correct_user
  	      @user = User.find(params[:id])
  	      redirect_to(root_url) unless current_user?(@user)
  	    end

  	    def admin_user
  	      redirect_to{roo_url} unless current_user.admin?
  	    end
  end