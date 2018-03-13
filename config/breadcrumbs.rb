crumb :root do
  link "Accueil", root_path
end

crumb :manifest do
  link "Signez le manifeste"
  parent :root
end

crumb :about_website do
  link "À propos du site web", a_propos_path
  parent :root
end

crumb :mumble do
  link "Discussion Mumble", mumble_path
  parent :root
end

crumb :hives do
  link "Nos organisations régionales", hives_path
  parent :root
end

crumb :hive do |hive|
  link hive.name, hive_path(hive)
  parent :hives
end

crumb :hive_meetings do |h|
  link "Réunions", hive_hive_meetings_path(h)
  parent :hive, h
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
  link "Vision"
  parent :mission
end

crumb :moyen do
  link "Moyens et objectifs"
  parent :mission
end

crumb :mission_nous_rejoindre do
  link "Nous rejoindre"
  parent :mission
end

crumb :promotional_tools do
  link "Promouvoir"
  parent :root
end

crumb :nous_joindre do
  link "Nous joindre", nous_joindre_path
  parent :root
end

crumb :organigramme do
  link "Organigramme", structure_path
  parent :root
end

crumb :coor do
  link "Comité organisateur (COOR)"
  parent :noyau
end

crumb :responsables_regionaux do
  link "Responsables régionaux"
  parent :noyau
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

crumb :all_signatures do
  link "Signatures du manifeste"
  parent :root
end


#### ADMIN CRUMBS
crumb :admin_root do
  link "Accueil", admin_root_path
end

crumb :admin_members do
  link "Signatures", admin_members_path
  parent :admin_root
end


crumb :admin_hives do
  link "Gestion des ACRQ", admin_hives_path
  parent :admin_root
end

crumb :edit_hive do |h|
  link "Modifier une ACRQ", edit_admin_hive_path(h)
  parent :admin_hives
end

crumb :admin_hive_contacts do |h|
  link "Responsables (#{h.name})", admin_hive_hive_contacts_path(h)
  parent :admin_hives
end

crumb :new_hive_contact do |h|
  link "Ajouter un responsable", new_admin_hive_hive_contact_path(h)
  parent :admin_hive_contacts, h
end

crumb :edit_hive_contact do |c|
  link "Modifier un responsable", edit_admin_hive_contact_path(c)
  parent :admin_hive_contacts, c.hive
end

crumb :admin_hive_meetings do |h|
  link "Réunions (#{h.name})", admin_hive_hive_meetings_path(h)
  parent :admin_hives
end

crumb :new_hive_meeting do |h|
  link "Ajouter une réunion", new_admin_hive_hive_meeting_path(h)
  parent :admin_hive_meetings, h
end

crumb :edit_hive_meeting do |m|
  link "Modifier une réunion", edit_admin_hive_meeting_path(m)
  parent :admin_hive_meetings, m.hive
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
