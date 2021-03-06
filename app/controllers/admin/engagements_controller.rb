class Admin::EngagementsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  def index
    @engagements = Engagement.order("created_at DESC")
  end

  def new
    @engagement = Engagement.new
  end

  def edit
    @engagement = Engagement.find(params[:id])
    @engagement.candidate_name = @engagement.candidate.full_name
  end

  def create
    @engagement = Engagement.new(engagement_params)

    if @engagement.save
      flash[:notice] = "La réponse du candidat a été enregistrée"
      redirect_to admin_engagements_path
    else
      render :new
    end
  end

  def update
    @engagement = Engagement.find(params[:id])

    @engagement.assign_attributes(engagement_params)
    if @engagement.save
      flash[:notice] = "La réponse du candidat a été modifiée"
      redirect_to admin_engagements_path
    else
      render :edit
    end
  end

  def destroy
    @engagement = Engagement.find(params[:id])
    @engagement.destroy
    flash[:notice] = "La réponse du candidat a été supprimée"
    redirect_to admin_engagements_path
  end

  private
  def engagement_params
    params.require(:engagement).permit(:candidate_id, :engagement_name, :status, :notes)
  end
end
