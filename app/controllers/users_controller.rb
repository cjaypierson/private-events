class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find_by(id: params[:id])
		#@events = Event.joins(commitments: :event_attendee).where("commitments.event_attendee_id = #{@user.id} OR events.creator_id = #{@user.id}")
		@past_created = @user.past_created_events
		@past_attended = @user.past_attended_events
		@upcoming_attended = @user.upcoming_attended_events
		@upcoming_created = @user.upcoming_created_events
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy

	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
