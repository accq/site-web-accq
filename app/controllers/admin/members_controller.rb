class Admin::MembersController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  def approve
    m = Member.find(params[:id])
    m.confirmed_at = Time.now
    m.save
    flash[:success] = "La signature a été approuvée et apparaît maintenant sur le site."
    redirect_to admin_members_path
  end

  def disapprove
    m = Member.find(params[:id])
    m.confirmed_at = nil
    m.save
    flash[:success] = "La signature a été désapprouvée et n'apparaît plus sur le site."
    redirect_to admin_members_path    
  end

  def index
    @unconfirmed_members = Member.unconfirmed.order("created_at")
    @confirmed_members = Member.confirmed.paginate(page: params[:page]).order("created_at DESC")

    respond_to do |format|
      format.html
      format.csv {
        x=Member.confirmed.order('created_at desc').collect{|m| ["\"#{m.name.to_s.strip}\"", "\"#{m.email.to_s.strip}\"", "\"#{m.phone.to_s.strip}\"", "\"#{m.city.to_s.strip}\"", "\"#{m.postal_code.to_s.strip}\"", "\"#{m.created_at}\""].join(',')}.join("\r\n")
        send_data x
      }
    end
  end

  def destroy
    m = Member.find(params[:id])
    m.destroy
    flash[:success] = "La signature a été supprimée de la base de données."
    redirect_to admin_members_path    
  end
end
