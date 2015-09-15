class Admin::MediaCoverageItemsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!

  def index
    @mci = MediaCoverageItem.order("published_on DESC")
  end

  def new
    @mci = MediaCoverageItem.new
  end

  def edit
    @mci = MediaCoverageItem.find(params[:id])
  end  

  def create
    @mci = MediaCoverageItem.new(media_coverage_item_params)
    if @mci.save
      flash[:success] = "L'item a été ajouté avec succès"
      redirect_to admin_media_coverage_items_path
    else
      render :new
    end
  end  

  def update
    @mci = MediaCoverageItem.find(params[:id])
    if @mci.update_attributes(media_coverage_item_params)
      flash[:success] = "L'item a été sauvegardé avec succès"
      redirect_to admin_media_coverage_items_path
    else
      render :edit
    end
  end    

  def destroy
    @mci = MediaCoverageItem.find(params[:id])
    @mci.destroy
    flash[:success] = "L'item a été supprimé de la base de données"
    redirect_to admin_media_coverage_items_path
  end

  private
  def media_coverage_item_params
    params.require(:media_coverage_item).permit(:title, :url, :archived_url, :media_type, :source, :remove_preview_image, :summary, :published_on, :preview_image)
  end
end