class Admin::ParticipantsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :get_event, only: :index

  def index
    @participants = @event.participants.order("created_at DESC")
    
    respond_to do |format|
      format.html
      format.csv {
        x=@event.participants.order('created_at desc').collect{|m| ["\"#{m.first_name.to_s.strip}\"","\"#{m.last_name.to_s.strip}\"", "\"#{m.email.to_s.strip}\"", "\"#{m.phone.to_s.strip}\"", "\"#{m.created_at}\""].join(',')}.join("\r\n")
        if @event.id == 2
          send_data x, filename: "signataires.csv"
        else
          send_data x
        end
      }
    end
    
  end
  
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    flash[:notice] = "L'élément a été supprimé"
    redirect_to admin_event_participants_path(event_id: @participant.event.id)
  end


  private
  def get_event
    @event = Event.find(params[:event_id])
  end
end
