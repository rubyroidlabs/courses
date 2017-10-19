require 'csv'

csv_string = CSV.generate do |csv|
  csv << [1,2,3]
  csv << ['he','she','OHO']
  csv << [:do, :not, :know]
end

File.open('csv.txt', 'w+') { |f| f << csv_string }
