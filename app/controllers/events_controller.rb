class EventsController < ApplicationController

	def index
		@upcoming_events = Event.upcoming.all
		@past_events = Event.past.all
	end
	
	def new
		@event = Event.new
	end

	def create
		event = current_user.created_events.build(event_params)
		if event.save
			redirect_to event
		else
			render 'new'
		end 
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def event_params
			params.require(:event).permit(:name, :description, :location, :time)
		end
end
