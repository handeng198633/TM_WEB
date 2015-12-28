class TrainticketsController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
	before_action :admin_user, only: :destroy

  	def index
    	  respond_to do |format|
      	format.html {}
      	format.json { render json: TrainticketsDatatable.new(view_context) }
        end
    end

    def show
    	
    end

    	def new
      		@trainticket = Trainticket.new
      end

    	def create
    		@trainticket = Trainticket.new(trainticket_params)
        @trainticket.record_person = current_user.name
    		if @trainticket.save
    			redirect_to traintickets_path
    		else
    			render 'new'
    		end
    	end

    	def destroy
    		Trainticket.find(params[:id]).destroy
        	redirect_to traintickets_path
    	end


    	private

  	  	def trainticket_params
  	  		params.require(:trainticket).permit(:category, :order_id, :number, :outdate, :travel_content, :combined_transport, :place, :person_name, :person_idcard, :ticket_cost, :difficulty, :seat1, :seat2, :remark, :record_remark, :state, :state_step)
  	  	end

  	    def correct_user
  	      @user = User.find(params[:id])
  	      redirect_to(root_url) unless current_user?(@user)
  	    end

  	    def admin_user
  	      redirect_to{roo_url} unless current_user.admin?
  	    end
end
