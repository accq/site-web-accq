class HomeController < ApplicationController
  def manifest
    @latest_signatures = Member.confirmed.order("created_at DESC").limit(30)
  end

  def show
    @hives = Hive.order(:number)
    @next_event = Event.upcoming.first
  end
end