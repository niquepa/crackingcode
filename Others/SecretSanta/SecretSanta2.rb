require 'csv'

file_name = "group2.csv"

# persons = CSV.parse(File.read(file_name), headers: true)
persons = CSV.read(file_name)
persons.shift # TODO: remove header in a more elegant way

@not_assigned_yet = persons.dup
@matches = {}

def set_universe(email)
  @not_assigned_yet.reject { |p| p[1] == email }
end

def assign_friend(universe)
  friend = universe[rand(universe.length)]
  @not_assigned_yet.reject! { |p| p[1] == friend[1] }
  friend[1]
end

persons.each do |person|
  email = person[1]
  universe = set_universe(email)
  assigned = assign_friend(universe)
  # puts "Person: #{email}"
  # puts "universe: #{universe}"
  # puts "assigned: #{assigned}"
  # puts " ====== "
  @matches[email] = assigned
end

@matches.each do |key, match|
  puts "Person: #{key} Santa Friend: #{match}"
end




