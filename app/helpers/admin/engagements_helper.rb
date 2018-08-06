module Admin::EngagementsHelper

  def display_engagement(status)
    if status == 0
      "refuse de s'y engager"
    elsif status == 1
      "s'y engage solenellement"
    elsif status == 2
      "refuse de se prononcer"
    elsif status == 3
      "en attente d'une réponse"
    end
  end
end
