require 'rest-client'
require 'json'
require 'pry'

def get_character_info_from_api(character)
  # result = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |character_info|
    if character_info["name"].downcase == character
      return character_info
    end
  end
  return nil
end

def get_character_movies_from_api(character)
  #make the web request
  result = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  character_info = get_character_info_from_api(character)
  if character_info == nil
    return nil
  end
      character_info["films"].each do |film|
        response_string = RestClient.get(film)
        response_hash = JSON.parse(response_string)
        result << response_hash
      end
  result
end

def print_movies(films_hash)
  if films_hash == nil
    puts "Couldn't find that character"
    response = get_character_from_user
    show_character_movies(response)
  else
    films_hash.each_with_index do |film, idx|
      puts "#{idx+1} #{film["title"]}"
    end
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

def get_film_info_from_api(film)
  # result = []
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |film_info|
    if film_info["title"].downcase == film.downcase
      return film_info
    end
  end
  return nil
end

def print_film_info(film_info)
  if film_info == nil
    puts "Couldn't find that film"
    response = get_film_from_user
    show_film_info(response)
  else
    puts "Title: #{film_info["title"]}"
    puts "Director: #{film_info["director"]}"
    puts "Producer: #{film_info["producer"]}"
    puts "Release Date: #{film_info["release_date"]}"
  end
end

def show_film_info(film)
  film_info = get_film_info_from_api(film)
  print_film_info(film_info)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
