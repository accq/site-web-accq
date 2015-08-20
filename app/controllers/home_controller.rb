class HomeController < ApplicationController
  def manifest
    @latest_signatures = Member.confirmed.order("created_at DESC").limit(30)
  end
end