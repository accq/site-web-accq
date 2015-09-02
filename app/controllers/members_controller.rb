class MembersController < ApplicationController  
  def create
    @member = Member.new(member_params)
    
    if @member.save
      flash[:success] = "Merci d'avoir signé notre manifeste! Nous vous invitons maintenant à lire nos <a href='mission' class='alert-link'>énoncés de mission</a>"
      redirect_to root_path
    else
      @latest_signatures = Member.confirmed.order("created_at DESC").limit(30)
      render "home/manifest"
    end
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :phone, :postal_code, :city)
  end
end