class Admin::WorkshopRegistrationsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  def index
    @workshop = Workshop.find(params[:workshop_id])
    @workshop_registrations = @workshop.workshop_registrations.order("created_at")
  end

  def destroy
    @workshop_registration = WorkshopRegistration.find(params[:id])
    @workshop_registration.destroy
    flash[:notice] = "L'inscription a été supprimée"
    redirect_to admin_workshop_workshop_registrations_path(@workshop_registration.workshop)
  end

  def edit
    @workshop_registration = WorkshopRegistration.find(params[:id])
  end

  def update
    @workshop_registration = WorkshopRegistration.find(params[:id])
    if @workshop_registration.update_attributes(workshop_registration_params)
      flash[:notice] = "Les informations ont été sauvegardées"
      redirect_to admin_workshop_workshop_registrations_path(@workshop_registration.workshop.id)
    else
      render :edit
    end
  end

  private
  def workshop_registration_params
    params.require(:workshop_registration).permit(:name, :email, :phone)
  end
end
