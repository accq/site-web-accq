class HivesController < ApplicationController
  def show
    action_name = params[:id].gsub("-","_")
    render action_name
  end
end
