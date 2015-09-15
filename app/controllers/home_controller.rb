class HomeController < ApplicationController
  def manifest
    @latest_signatures = Member.confirmed.order("created_at DESC").limit(30)
  end

  def show
    @hives = Hive.order(:number)
  end

  def media_coverage
    @mci = MediaCoverageItem.order("published_on DESC")
  end
end