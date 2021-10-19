require_relative '../texts'
require_relative '../classes/categories/movie'

def create_movie(item)
  Texts.text_ci3('movie', 'silent? (y / n)')
  answer = gets.chomp
  silent = true if answer == 'y'
  movie = Movie.new(silent, item)
  @movies << movie
  Texts.success('movie')
  movie
end
