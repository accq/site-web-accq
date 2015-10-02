class HiveMeetingsController < ApplicationController
  def index
    @hive = Hive.find(params[:hive_id])
    @meetings = @hive.hive_meetings.past
  end
end
