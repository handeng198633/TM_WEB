class PlaneticketsController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

  	def index
    	respond_to do |format|
      	format.html {}
      	format.json { render json: PlaneticketsDatatable.new(view_context) }
        end
    end

    def show
    	
    end

    	def new
      		@planeticket = Planeticket.new
      end

    	def create
    		@planeticket = Planeticket.new(planeticket_params)
        	@planeticket.record_person = current_user.name
    		if @planeticket.save
    			redirect_to planetickets_path
    		else
    			render 'new'
    		end
    	end

    	def destroy
    		Planeticket.find(params[:id]).destroy
        	redirect_to planetickets_path
    	end


    	private

  	  	def planeticket_params
  	  		params.require(:planeticket).permit(:category, :order_id, :number, :outdate, :travel_content, :combined_transport, :ticketdate, :place, :person_name, :person_idcard, :valid_date, :born_date, :ticket_cost, :counter_cost, :plane, :remark, :record_remark, :state, :state_step)
  	  	end

  	    def correct_user
  	      @user = User.find(params[:id])
  	      redirect_to(root_url) unless current_user?(@user)
  	    end

  	    def admin_user
  	      redirect_to{roo_url} unless current_user.admin?
  	    end
end
