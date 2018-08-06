class DistrictsController < ApplicationController
  def index
    @hives = Hive.order(:id)
    @districts = District.order("name")
  end
end
