class Admin::CandidatesController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  def autocomplete_index
    if request.xhr?
      candidates = Candidate.order("last_name, middle_name, first_name").where("lower(first_name || ' ' || last_name) like ?", "%#{params[:term].to_s.downcase}%").collect{|c|
        {
          :id => c.id,
          :label => c.full_name_district_and_party,
          :value => c.full_name,
          :district => c.district.name,
          :hive => c.district.hive.name,
          :party => c.political_party.name
        }
      }

      candidates << {id: -1, label: "Aucun candidat trouvé", value: "", short_name: ""} if candidates.empty?
      render :json => candidates.to_json
    end
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      flash[:notice] = "Le candidat a été ajouté"
      redirect_to admin_engagements_path
    else
      render :new
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    flash[:notice] = "Le candidat a été supprimé"
    redirect_to admin_candidates_path
  end
  def index
    @candidates = Candidate.order("last_name, middle_name, first_name")
  end

  private
  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :middle_name, :district_id, :political_party_id)
  end
end
