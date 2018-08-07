def welcome
  puts "Welcome! Do you want to learn about a film or about a character?"
  puts "Type C for character and F for film"
  response = gets.chomp.downcase
  while response != "c" && response != "f"
    puts "Please respond with either C or F only"
    response = gets.chomp.downcase
  end
  response
end

def c_or_f(response)
  if response == "c"
    character = get_character_from_user
    show_character_movies(character)
  elsif response == "f"
    film =  get_film_from_user
    show_film_info(film)
  end
end

def get_character_from_user
  puts "please enter a character"
  response = gets.chomp.downcase
  response
end

def get_film_from_user
  puts "please enter a film"
  response = gets.chomp.downcase
  response
end
