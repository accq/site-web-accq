class Admin::ParticipantsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :get_event

  def index
    @participants = @event.participants.order("created_at DESC")
  end


  private
  def get_event
    @event = Event.find(params[:event_id])
  end
end
