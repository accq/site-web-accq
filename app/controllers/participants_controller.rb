class ParticipantsController < ApplicationController  
  def create
    @event = Event.find(params[:event_id])
    @participant = Participant.new(participant_params.merge(event_id: @event.id))
    
    if @participant.save
      flash[:success] = "Merci! Votre présence à cet événement est grandement appréciée!"
      redirect_to root_path
    else
      render "events/show"
    end    

  end

  private
  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :email, :phone)
  end
end
