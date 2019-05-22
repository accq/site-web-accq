require 'csv'

members = []
CSV.foreach(Rails.root.to_s + "/lib/signatures_a_jour.csv", col_sep: ",", headers: true) do |row|
  members << Member.new(status: row[0], name: row[2].to_s + ' ' + row[1].to_s, email: row[3].to_s, phone: row[4].to_s, city: row[5].to_s, postal_code: row[6].to_s.delete(' ').upcase, confirmed_at: row[8] ? row[8].to_s.to_date : 2.years.ago)
end
Member.import(members, on_duplicate_key_ignore: true)
