people = []
people << Person.new("Smith")
people << Person.new("New")
people << Person.new("Trinity")
people << Person.new("Agent Smith")
people << Person.new("Morphius")
people << Person.new("Ms.Smith")

people.each do |guy|
  if guy.smith?
    puts "Kick #{guy.name} ass!"
  else
    puts "Give #{guy.name} a candy!"
  end
end
