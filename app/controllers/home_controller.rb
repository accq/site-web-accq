class HomeController < ApplicationController
  def manifest
    @latest_signatures = Member.confirmed.order("created_at DESC").limit(30)
  end

  def show
    @hives = Hive.order(:number)
    @next_event = Event.upcoming.first
  end

  def download_pdf
    send_file(
      "#{Rails.root}/public/Questionnaire-bilan-février-ACCQ.pdf",
      :filename => "Questionnaire-bilan-février-ACCQ.pdf",
      :type => "application/pdf"
    )
  end
end
