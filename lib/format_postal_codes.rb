Member.all.each do |m|
  pc=m.postal_code.delete(' ')
  pc=pc.delete('-')
  pc = pc.upcase
  m.postal_code = pc
  m.save
end
