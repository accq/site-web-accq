class ParticipantsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @participant = Participant.new(participant_params.merge(event_id: @event.id))
    
    if @participant.save
      if @event.id == 2
        flash[:success] = "Merci! Nous avons bien reçu votre signature."
      else
        flash[:success] = "Merci! Votre présence à cet événement est grandement appréciée!"
      end
      redirect_to event_participants_path(@event)
    else
      render "events/show"
    end

  end

def index
  @event = Event.find(params[:event_id])
end

  private
  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :email, :phone)
  end
end
