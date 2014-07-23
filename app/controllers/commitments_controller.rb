class CommitmentsController < ApplicationController
  
  def create
  	commitment = current_user.commitments.create(attended_event_id: params[:event_id])
  	redirect_to :back
  end
end
