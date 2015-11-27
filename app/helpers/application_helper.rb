module ApplicationHelper
  def show_hive_number(hive_number)
    sprintf '%02d', hive_number
  end

  def show_date_range(dt_start,dt_end)
    if dt_start == dt_end
      "Le #{l dt_start, format: :long}"
    elsif dt_start.month == dt_end.month
      "Les #{dt_start.day} et #{dt_end.day} #{l dt_end, format: :just_month} prochains"
    else
      "Les #{l dt_start, format: :no_year} et #{l dt_end, format: :no_year} prochains"
    end
  end
end
