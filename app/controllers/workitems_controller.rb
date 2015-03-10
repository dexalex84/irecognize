
class WorkitemsController < ApplicationController

  before_action :set_workitem, only: [:show, :edit, :update, :destroy] #:publish]
  before_action :check_current_user, only: [:edit, :update, :destroy] #:publish]
  # GET /workitems
  # GET /workitems.json
  
  def index
    #if @current_user_type == :performer
      #@workitems = Workitem.all.order(updated_at: :desc)
      #@workitems = Workitem.find_by(id: Status.where(name: "Published").map {|x| x.statusable_id} )
      @workitems = Workitem.find_by(id:21)
    #else
    #  @workitems = Workitem.all.order(updated_at: :desc)
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
    
    respond_to do |format|
      if @workitem.save

        Status.create(statusable: @workitem, name: "Published") if to_publish? 
        Status.create(statusable: @workitem, name: "New") if !to_publish? 

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
        st = @workitem.status

        st.update(statusable: @workitem, name:"Published") if to_publish?
        st.update(statusable: @workitem, name:"New") if to_unpublish?

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
        
        #@current_user_type = @workitem.user_type

        redirect_to workitems_path, notice: "Have no right to that item" if @workitem.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workitem_params
      params.require(:workitem).permit(:name, :description, :user_id, :status)
    end

end
