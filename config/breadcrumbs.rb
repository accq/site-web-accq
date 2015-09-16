crumb :root do
  link "Accueil", root_path
end

crumb :manifest do
  link "Signez le manifeste"
  parent :root
end

crumb :hives do
  link "Liste des ACRQ", hives_path
  parent :root
end

crumb :hive do |hive|
  link hive
  parent :hives
end

crumb :constat do
  link "Constat", constat_path
  parent :root
end

crumb :mission do
  link "Mission", mission_path
  parent :root
end

crumb :vision do
  link "Notre vision"
  parent :mission
end

crumb :moyen do
  link "Nos moyens et objectifs"
  parent :mission
end

crumb :mission_nous_rejoindre do
  link "Nous rejoindre"
  parent :mission
end

crumb :promotional_tools do
  link "Outils de promotion"
  parent :root
end

crumb :nous_joindre do
  link "Nous joindre", nous_joindre_path
  parent :root
end

crumb :noyau do
  link "Noyau central"
  parent :root
end

crumb :bibliotheque do
  link "Bibliothèque"
  parent :root
end

crumb :mediatheque do
  link "Médiathèque"
  parent :root
end

crumb :media do
  link "Médias"
  parent :root
end

crumb :media_coverage do
  link "Couverture médiatique", media_coverage_path
  parent :media
end

crumb :press_releases do
  link "Communiqués de presse", press_releases_path
  parent :media
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).