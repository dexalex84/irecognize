class WorkitemsController < ApplicationController
  before_action :set_workitem, only: [:show, :edit, :update, :destroy] #:publish]
  before_action :check_current_user, only: [:edit, :update, :destroy] #:publish]
  # GET /workitems
  # GET /workitems.json
  def index
    @workitems = Workitem.all
  end

  # GET /workitems/1
  # GET /workitems/1.json
  def show
  end

  # GET /workitems/new
  def new
    @workitem = current_user.workitems.build



    
  end

  # GET /workitems/1/edit
  def edit
  end

  # POST /workitems
  # POST /workitems.json
  def create
    @workitem = current_user.workitems.build(workitem_params)
    
    if to_publish? 
      @workitem.status = get_published_stat 
    else
      @workitem.status = get_new_stat
    end

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
    
    @workitem.status = get_published_stat if to_publish?
    @workitem.status = get_new_stat  if to_unpublish?

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

#
#  def publish
#    published = Status.find_by(statusable_type: 'Workitem', name: 'Published')
#    @workitem.update(status: published) unless published.nil?
#  end

    def to_publish?
      params[:commit]=="Publish" 
    end

    def to_unpublish?
      params[:commit]=="Unpublish"
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workitem
      @workitem = Workitem.find(params[:id])
    end

    def check_current_user
        @workitem = current_user.workitems.find_by(id: params[:id])
        redirect_to workitems_path, notice: "Have no right to that item" if @workitem.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workitem_params
      params.require(:workitem).permit(:name, :description, :user_id, :status)
    end

    def get_published_stat
        Status.find_by(statusable_type: 'Workitem', name: 'Published')
    end

    def get_new_stat
        Status.find_by(statusable_type: 'Workitem', name: 'New')
    end
end
