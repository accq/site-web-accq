class WorkshopRegistrationsController < ApplicationController

  def new
    @workshop = Workshop.active.find(params[:workshop_id])
    @workshop_registration = @workshop.workshop_registrations.build
  end

  def create
    @workshop = Workshop.active.find(params[:workshop_id])
    @workshop_registration = WorkshopRegistration.new(workshop_registration_params)
    @workshop_registration.workshop_id = @workshop.id
    if @workshop_registration.save
      flash[:notice] = "Merci! Votre inscription à l'atelier a bien été reçue."
      redirect_to workshops_path
    else
      render :new
    end
  end

  private
  def workshop_registration_params
    params.require(:workshop_registration).permit(:name, :email, :phone)
  end
end
