require 'csv'

@not_assigned_yet = @persons.dup
@matches = {}

def set_universe(email)
  @not_assigned_yet.reject { |p| p[1] == email }
end

def assign_friend(universe, penultimate_person)
  friend = if penultimate_person
             @persons[@persons.length-1]
           else
             universe[rand(universe.length)]
           end

  @not_assigned_yet.reject! { |p| p[1] == friend[1] }
  friend[1]
end

def secret_santa(@persons)
  @persons.each_with_index do |person, index|
    email = person[1]
    universe = set_universe(email)
    assigned = assign_friend(universe, @persons.length-2 == index)
    @matches[email] = assigned
  end
  @matches
end


file_name = "group1.csv"
@persons = CSV.read(file_name)
@persons.shift # TODO: remove header in a more elegant way

matches = secret_santa(@persons)
@matches.each do |key, match|
  puts "Person: #{key} Santa Friend: #{match}"
end




