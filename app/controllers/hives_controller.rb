class HivesController < ApplicationController
  def show
    @hive = Hive.find(params[:id])
    @next_meeting  = @hive.hive_meetings.upcoming.any? ? @hive.hive_meetings.upcoming.first : nil
    @past_meetings = @hive.hive_meetings.past
  end

  def index
    @hives = Hive.order(:number)    
  end
end
