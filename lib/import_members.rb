require 'csv'

#members = []

#MAKE SURE TO LOAD THE csv variable in the console before executing the following.
CSV.parse(csv, col_sep: ",", headers: true) do |row|
  existing_member = Member.where("email = ?", row[3].to_s.strip).first
  str_date = row[8].to_s
  str_date = str_date.gsub("juin", "june").gsub("déc", "december").gsub("avril","april").gsub("mars","march").gsub("août","august").gsub("mai", "may").gsub("janv.","January").gsub("juil.", "jul.").gsub("avr.", "apr.")
  if existing_member
    existing_member.update_attributes(status: row[0], name: row[2].to_s + ' ' + row[1].to_s,  phone: row[4].to_s, city: row[5].to_s, postal_code: row[6].to_s.delete(' ').upcase, confirmed_at: row[8] ? (Date.parse(str_date)) : 2.years.ago, no_region: row[7])
  else
    Member.create(status: row[0], name: row[2].to_s + ' ' + row[1].to_s, email: row[3].to_s.strip, phone: row[4].to_s, city: row[5].to_s, postal_code: row[6].to_s.delete(' ').upcase, confirmed_at: row[8] ? (Date.parse(str_date)) : 2.years.ago)
  end
end
