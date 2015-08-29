class Admin::HivesController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  def index
    @hives = Hive.order(:number)
  end

  def edit
    @hive = Hive.find(params[:id])
  end

  def new
    @hive = Hive.new
  end

  def update
    @hive = Hive.find(params[:id])

    if @hive.update_attributes(hive_params)
      flash[:success] = "Les changements ont été enregistrés"
      redirect_to admin_hives_path
    else
      render :edit
    end
  end

  def create
    @hive = Hive.new(hive_params)
    if @hive.save
      flash[:success] = "L'ACRQ a été ajoutée"
      redirect_to admin_hives_path
    else
      render :new
    end
  end

  def destroy
    @hive = Hive.find(params[:id])
    @hive.destroy
    flash[:success] = "L'ACRQ a été supprimée."
    redirect_to admin_hives_path
  end

  private
  def hive_params
    params.require(:hive).permit(:number, :name, :fb_url, :image)
  end
end
