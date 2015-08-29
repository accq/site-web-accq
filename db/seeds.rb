# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Les seeds sont seulement utilisés en développement. Ne pas seeder la base de données en production avec ces valeurs.
User.create(email: "admin@admin.com", password: "temporaire", password_confirmation: "temporaire")

#Les ruches (ACRQs)
hives = Hive.create([
  {number: 1, name: "Bas-St-Laurent", fb_url: "https://www.facebook.com/groups/ACRQ01"},
  {number: 2, name: "Saguenay/Lac-St-Jean", fb_url: "https://www.facebook.com/groups/ACRQ02"},
  {number: 3, name: "Capitale-Nationale", fb_url: "https://www.facebook.com/groups/ACRQ03"},
  {number: 4, name: "Mauricie", fb_url: "https://www.facebook.com/groups/ACRQ04"},
  {number: 5, name: "Estrie", fb_url: "https://www.facebook.com/groups/ACRQ05"},
  {number: 6, name: "Montréal", fb_url: "https://www.facebook.com/groups/ACRQ06"},
  {number: 7, name: "Outaouais", fb_url: "https://www.facebook.com/groups/ACRQ07"},
  {number: 8, name: "Abitibi-Temiscamingue", fb_url: "https://www.facebook.com/groups/ACRQ08"},
  {number: 9, name: "Côte-Nord", fb_url: "https://www.facebook.com/groups/ACRQ09"},
  {number: 10, name: "Nord-du-Québec", fb_url: "https://www.facebook.com/groups/ACRQ10"},
  {number: 11, name: "Gaspésie/Îles-de-la-Madeleine", fb_url: "https://www.facebook.com/groups/ACRQ11"},
  {number: 12, name: "Chaudière-Appalaches", fb_url: "https://www.facebook.com/groups/ACRQ12"},
  {number: 13, name: "Laval", fb_url: "https://www.facebook.com/groups/ACRQ13"},
  {number: 14, name: "Lanaudière", fb_url: "https://www.facebook.com/groups/ACRQ14"},
  {number: 15, name: "Laurentides", fb_url: "https://www.facebook.com/groups/ACRQ15"},
  {number: 16, name: "Montérégie", fb_url: "https://www.facebook.com/groups/ACRQ16"},
  {number: 17, name: "Centre-du-Québec", fb_url: "https://www.facebook.com/groups/ACRQ17"}
])