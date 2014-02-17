class EventsController < ApplicationController

	def index
		current_user.visits.create(action: "view events")
		@events = Event.all
		RMeetup::Client.api_key = "71d76962b756b6f2a393521317528"
		@results = RMeetup::Client.fetch(:events,{:zip => "94107"})
	end

	def new
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :events
		end
		@event = Event.new
	end

	def show
		current_user.visits.create(action: "view event")
		id = params.require(:id)
		@event = Event.find(id)
	end

	def create
		current_user.visits.create(action: "create event")
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :events
		end
		parameters = params.require(:event).permit(:title, :date, :time, :location, :cost, :description)
		event = Event.create(parameters)
		flash[:alert] = "Error: " + event.errors.full_messages.first if event.errors.any?
		redirect_to events_path
	end

	def edit
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :events
		end
		id = params.require(:id)
		@event = Event.find(id)
	end

	def update
		current_user.visits.create(action: "edit event")
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :events
		end
		id = params.require(:id)
		updates = params.require(:event).permit(:title, :date, :time, :location, :cost, :description)
		event = Event.find(id)
		event.update(updates)
		flash[:alert] = "Error: " + event.errors.full_messages.first if event.errors.any?
		redirect_to events_path
	end

	def destroy
		current_user.visits.create(action: "delete event")
		if current_user.role != "coordinator"
			flash[:alert] = "You must be a coordinator"
			redirect_to :events
		end
		id = params.require(:id)
		Event.destroy(id)
		redirect_to events_path
	end

	def rsvp
		current_user.visits.create(action: "rsvp to event")
		id = params.require(:id)
		event = Event.find(id)
		event.users << current_user
		flash[:notice] = "You are attending #{event.title}!"
		redirect_to events_path
	end

	def cancel_rsvp
		current_user.visits.create(action: "canvel rsvp to event")
		id = params.require(:id)
		event = Event.find(id)
		event.users.delete(current_user)
		flash[:notice] = "You are no longer attending #{event.title}"
		redirect_to events_path
	end

end
