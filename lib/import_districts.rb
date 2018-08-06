require 'csv'

class EngagementImporter
  def import_candidates
    csv_text = File.read(Rails.root.to_s + "/lib/candidats.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      2.upto(9) do |column_index|
        if row[column_index].to_s.strip != ''
          candidate = Candidate.new
          full_name = row[column_index]
          names = full_name.split(" ")
          if names.count == 2
            candidate.first_name = names[0]
            candidate.last_name = names[1]
          elsif names.count == 3
            candidate.first_name = names[0]
            candidate.middle_name = names[1]
            candidate.last_name = names[2]
          end

          candidate.political_party_id = get_political_party_id(csv.headers[column_index])
          candidate.district_id = get_district_id(row[0])
          candidate.save
        end

      end
    end
  end

  def import_districts
    csv_text = File.read(Rails.root.to_s + "/lib/candidats.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      d= District.new(name: row[0])

      #Find correct hive
      d.hive_id = get_hive_id(row[1])
      d.save
    end
  end

  def get_political_party_id(name)
    PoliticalParty.where("name = ?", name).first.id
  end

  def get_hive_id(name)
    if name == "Abit-Témisc"
      8
    elsif name == "Bas-St-L"
      1
    elsif name == "Centre-du-Q"
      17
    elsif name == "Chaud-Appal"
      12
    elsif name == "Côte-Nord"
      9
    elsif name == "Estrie"
      5
    elsif name == "Gasp-Iles Mad"
      11
    elsif name == "Lanaudière"
      14
    elsif name == "Laurentides"
      15
    elsif name == "Laval"
      13
    elsif name == "Mauricie"
      4
    elsif name == "Montérégie"
      16
    elsif name == "Montréal"
      6
    elsif name == "Nord-du-Q"
      10
    elsif name == "Outaouais"
      7
    elsif name == "Rég Québec"
      3
    elsif name == "Sagu-Lac-St-J"
      2
    end
  end

  def get_district_id(name)
    District.where("name = ?", name).first.id
  end
end
