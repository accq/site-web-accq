class WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.active.order("starts_at")
  end
end
