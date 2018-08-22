class EngagementsController < ApplicationController

  def index
    if params[:district_id]
      @district = District.find(params[:district_id])
      @engagements = @district.engagements
      @candidates = @district.candidates
      @non_sollicited = @district.candidates.includes(:engagement).references(:engagements).where("engagements.id IS NULL")
    else
      @engagements = Engagement.where("status <> 3")
    end
  end
end
