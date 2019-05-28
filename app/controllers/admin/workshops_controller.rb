class Admin::WorkshopsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  def index
    @workshops = Workshop.order("starts_at")
  end

  def edit
    @workshop = Workshop.find(params[:id])
    @workshop.start_date = @workshop.starts_at.to_date
    @workshop.start_time = @workshop.starts_at.to_time.strftime("%H:%M")
  end

  def update
    @workshop = Workshop.find(params[:id])
    if @workshop.update_attributes(workshop_params)
      flash[:notice] = "Les informations ont été modifiées"
      redirect_to admin_workshops_path
    else
      render :edit
    end
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    if @workshop.save
      flash[:notice] = "L'atelier a été créé avec succès"
      redirect_to admin_workshops_path
    else
      render :new
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    if @workshop.workshop_registrations.any?
      flash[:error] = "Des inscriptions sont associées à cet atelier. Veuillez les supprimer."
      redirect_to admin_workshops_path
    else
      @workshop.destroy
      flash[:notice] = "L'atelier a été supprimé"
      redirect_to admin_workshops_path
    end
  end

  private
  def workshop_params
    params.require(:workshop).permit(:name, :description, :starts_at, :ends_at, :available_slots, :animation, :expertise, :start_date, :start_time)
  end
end
