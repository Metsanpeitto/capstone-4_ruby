require_relative '../texts'

def list_items
  Texts.text_list_intro
  option = gets.chomp
  # option = '1'
  display_items(@books, 'books') if option == '1'
  display_items(@music_albums, 'music albums') if option == '2'
  display_items(@movies, 'movies') if option == '3'
  display_items(@games, 'games') if option == '4'
  display_genres_sources(@genres, 'genres') if option == '5'
  display_labels(@labels, 'labels') if option == '6'
  display_authors(@authors, 'authors') if option == '7'
  display_genres_sources(@sources, 'sources') if option == '8'
end