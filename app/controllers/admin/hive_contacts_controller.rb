class Admin::HiveContactsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  def index
    @hive = Hive.find(params[:hive_id])
    @hive_contacts = @hive.hive_contacts
  end

  def edit
    @hive_contact = HiveContact.find(params[:id])    
  end

  def new    
    @hive = Hive.find(params[:hive_id])
    @hive_contact = HiveContact.new(hive: @hive)
  end

  def update
    @hive_contact = HiveContact.find(params[:id])

    if @hive_contact.update_attributes(hive_contact_params.merge(hive: @hive_contact.hive))
      flash[:success] = "Les informations du responsable ont été modifiées"
      redirect_to admin_hive_hive_contacts_path(@hive_contact.hive)
    else
      render :edit
    end
  end

  def create
    @hive = Hive.find(params[:hive_id])
    @hive_contact = HiveContact.new(hive_contact_params.merge(hive: @hive))

    if @hive_contact.save
      flash[:success] = "Le responsable a été ajouté"
      redirect_to admin_hive_hive_contacts_path
    else
      render :new
    end
  end

  def destroy
    @hive_contact = HiveContact.find(params[:id])
    if @hive_contact.destroy    
      flash[:success] = "Le responsable a été supprimé"
    else
      flash[:error] = "Une erreur est survenue"
    end
    redirect_to admin_hive_hive_contacts_path(@hive_contact.hive)
  end

  private
  def hive_contact_params
    params.require(:hive_contact).permit(:full_name, :email, :phone, :fb_page)
  end
end
