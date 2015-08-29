class HivesController < ApplicationController
  def show
    @hive = Hive.find(params[:id])
  end

  def index
    @hives = Hive.order(:number)
  end
end
