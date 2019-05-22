require 'csv'

items = []
CSV.foreach(Rails.root.to_s + "/postalcodes.csv", col_sep: ";", headers: true) do |row|
  items << PostalCode.new(postal_code: row[0], city: row[4], no_administrative_region: row[8], administrative_region: row[9])
end
PostalCode.import(items, on_duplicate_key_ignore: true)
