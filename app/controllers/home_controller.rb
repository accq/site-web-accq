class HomeController < ApplicationController
  def manifest
    @latest_signatures = Member.confirmed.order("created_at DESC").limit(30)
  end

  def show
    @hives = Hive.order(:number)
    @next_event = Event.upcoming.first
  end

  def sondage
  end

  def download
    public_folder=File.join(Rails.root, "public")
    send_file(File.join(public_folder, params[:filename]))
  end


end
