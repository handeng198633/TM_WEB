class TicketstatesController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :update, :new, :show]
  before_action :set_ticketstate, only: [:show, :edit, :update, :destroy]

  # GET /ticketstates
  # GET /ticketstates.json
  def index
    @ticketstates = Ticketstate.all
  end

  # GET /ticketstates/1
  # GET /ticketstates/1.json
  def show
  end

  # GET /ticketstates/new
  def new
    @ticketstate = Ticketstate.new
  end

  # GET /ticketstates/1/edit
  def edit
  end

  # POST /ticketstates
  # POST /ticketstates.json
  def create
    @ticketstate = Ticketstate.new(ticketstate_params)

    respond_to do |format|
      if @ticketstate.save
        format.html { redirect_to @ticketstate, notice: '创建成功' }
        format.json { render :show, status: :created, location: @ticketstate }
      else
        format.html { render :new }
        format.json { render json: @ticketstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticketstates/1
  # PATCH/PUT /ticketstates/1.json
  def update
    respond_to do |format|
      if @ticketstate.update(ticketstate_params)
        format.html { redirect_to @ticketstate, notice: '更新成功' }
        format.json { render :show, status: :ok, location: @ticketstate }
      else
        format.html { render :edit }
        format.json { render json: @ticketstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticketstates/1
  # DELETE /ticketstates/1.json
  def destroy
    @ticketstate.destroy
    respond_to do |format|
      format.html { redirect_to ticketstates_url, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticketstate
      @ticketstate = Ticketstate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticketstate_params
      params.require(:ticketstate).permit(:stateinfo, :start_time)
    end
end
