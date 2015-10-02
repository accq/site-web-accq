class Admin::HiveMeetingsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  def index
    @hive = Hive.find(params[:hive_id])
    @hive_meetings = @hive.hive_meetings
  end

  def edit
    @hive_meeting = HiveMeeting.find(params[:id])    
  end

  def new    
    @hive = Hive.find(params[:hive_id])
    @hive_meeting = HiveMeeting.new(hive: @hive)
  end

  def update
    @hive_meeting = HiveMeeting.find(params[:id])

    if @hive_meeting.update_attributes(hive_meeting_params.merge(hive: @hive_meeting.hive))
      flash[:success] = "Les informations de la réunion ont été modifiées"
      redirect_to admin_hive_hive_meetings_path(@hive_meeting.hive)
    else
      render :edit
    end
  end

  def create
    @hive = Hive.find(params[:hive_id])
    @hive_meeting = HiveMeeting.new(hive_meeting_params.merge(hive: @hive))

    if @hive_meeting.save
      flash[:success] = "La réunion a été ajoutée"
      redirect_to admin_hive_hive_meetings_path
    else
      render :new
    end
  end

  def destroy
    @hive_meeting = HiveMeeting.find(params[:id])
    if @hive_meeting.destroy    
      flash[:success] = "La réunion a été supprimée"
    else
      flash[:error] = "Une erreur est survenue"
    end
    redirect_to admin_hive_hive_meetings_path(@hive_meeting.hive)
  end

  private
  def hive_meeting_params
    params.require(:hive_meeting).permit(:location, :address, :meeting_date, :meeting_time, :city, :agenda, :report, :remove_agenda, :remove_report)
  end
end
