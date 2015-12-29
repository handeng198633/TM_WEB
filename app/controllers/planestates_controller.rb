class PlanestatesController < ApplicationController
  before_action :set_planestate, only: [:show, :edit, :update, :destroy]

  # GET /planestates
  # GET /planestates.json
  def index
    @planestates = Planestate.all
  end

  # GET /planestates/1
  # GET /planestates/1.json
  def show
  end

  # GET /planestates/new
  def new
    @planestate = Planestate.new
  end

  # GET /planestates/1/edit
  def edit
  end

  # POST /planestates
  # POST /planestates.json
  def create
    @planestate = Planestate.new(planestate_params)

    respond_to do |format|
      if @planestate.save
        format.html { redirect_to @planestate, notice: '创建成功！' }
        format.json { render :show, status: :created, location: @planestate }
      else
        format.html { render :new }
        format.json { render json: @planestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planestates/1
  # PATCH/PUT /planestates/1.json
  def update
    respond_to do |format|
      if @planestate.update(planestate_params)
        format.html { redirect_to @planestate, notice: '更新成功！' }
        format.json { render :show, status: :ok, location: @planestate }
      else
        format.html { render :edit }
        format.json { render json: @planestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planestates/1
  # DELETE /planestates/1.json
  def destroy
    @planestate.destroy
    respond_to do |format|
      format.html { redirect_to planestates_url, notice: '删除成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planestate
      @planestate = Planestate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planestate_params
      params.require(:planestate).permit(:stateinfo, :start_time)
    end
end
