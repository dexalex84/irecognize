class OffersController < ApplicationController
	before_filter :load_workitem, except: [:destroy]

	def new 
		@offer = @workitem.offers.new
	end

	def create 
		@offer = @workitem.offers.new(offer_params)
		@offer.user_id = current_user.id

	  if @offer.save
        redirect_to @workitem, notice: 'Offer was successfully created.' 

      else
        render :new 

      end

	end

	def show
	end



	def load_workitem
		@workitem = Workitem.find(params[:workitem_id])
	end

    def offer_params
      params.require(:offer).permit(:workitem, :description, :user_id, :price, :time,:status_id)
    end
end
