class WorkitemsController < ApplicationController
  before_action :set_workitem, only: [:show, :edit, :update, :destroy]

  # GET /workitems
  # GET /workitems.json
  def index
    @workitems = Workitem.all
  end

  # GET /workitems/1
  # GET /workitems/1.json
  def show
    @workitem = Workitem.find(params[:id])
  end

  # GET /workitems/new
  def new
    @workitem = current_user.workitems.build
  end

  # GET /workitems/1/edit
  def edit
    @workitem = Workitem.find(params[:id])
    @workitem.name        = params[:name]
    @workitem.description = params[:description]
  end

  # POST /workitems
  # POST /workitems.json
  def create
    @workitem = current_user.workitems.build(workitem_params)

    respond_to do |format|
      if @workitem.save
        format.html { redirect_to @workitem, notice: 'Workitem was successfully created.' }
        format.json { render :show, status: :created, location: @workitem }
      else
        format.html { render :new }
        format.json { render json: @workitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workitems/1
  # PATCH/PUT /workitems/1.json
  def update
    respond_to do |format|
      if @workitem.update(workitem_params)
        format.html { redirect_to @workitem, notice: 'Workitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @workitem }
      else
        format.html { render :edit }
        format.json { render json: @workitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workitems/1
  # DELETE /workitems/1.json
  def destroy
    @workitem.destroy
    respond_to do |format|
      format.html { redirect_to workitems_url, notice: 'Workitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workitem
      @workitem = Workitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workitem_params
      params.require(:workitem).permit(:name, :description, :user_id)
    end
end
