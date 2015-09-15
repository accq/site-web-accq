module ApplicationHelper
  def show_hive_number(hive_number)
    sprintf '%02d', hive_number
  end

  def show_media_type_icon(media_type)
    if media_type == 'text'
      "<i class='fa fa-newspaper-o'></i> Article".html_safe
    elsif media_type == 'audio'
      "<i class='fa fa-microphone'></i> Audio".html_safe
    elsif media_type == 'video'
      "<i class='fa fa-video-camera'></i> Vidéo".html_safe
    end
  end    
end
