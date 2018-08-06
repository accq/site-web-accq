module Admin::EngagementsHelper

  def display_engagement(status)
    if status == 0
      "rejette l'engagement"
    elsif status == 1
      "s'engage solonellement"
    elsif status == 2
      "refuse de se prononcer"
    elsif status == 3
      "Pas de réponse"
    end
  end
end
