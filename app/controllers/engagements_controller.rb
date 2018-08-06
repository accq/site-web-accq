class EngagementsController < ApplicationController

  def index
    @district = District.find(params[:district_id])
    @engagements = @district.engagements
    @candidates = @district.candidates
    @non_sollicited = @district.candidates.includes(:engagement).references(:engagements).where("engagements.id IS NULL")
  end
end
