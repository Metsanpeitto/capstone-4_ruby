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

def display_items(data, category)
  puts "Display archived"
  puts @archived_items
  puts "List of #{category}"
  data.each_with_index do |data_item, index|
    puts data_item.instance_of?(Array)
    item = nil
    item = if data_item.instance_of?(Array)
             data_item[0]
           else
             data_item
           end
    puts item.class
    message = "Publisher: #{item.publisher} | Cover State: #{item.cover_state}" if item.instance_of?(Book)
    message = "On Spotify: #{item.on_spotify}" if item.instance_of?(MusicAlbum)
    message = "Silent: #{item.silent}" if item.instance_of?(Movie)
    message = "Game: #{item.multiplayer} | Last timeplayed: #{item.last_played_at}" if item.instance_of?(Game)
    message = "Author: #{item.first_name} #{item.second_name} " if category == 'authors'
    message = "Sources: #{item.name}" if category == 'sources'

    puts "#{index})  Title: #{item.label.title} | Genre: #{item.genre.name} |  Author: #{item.author.first_name}  #{item.author.last_name} | Source: #{item.source.name}
    #{message}

    "
  end
end

def display_genres_sources(data, category)
  puts "List of #{category}"
  data.each_with_index do |item, index|
    puts "#{index})  Name: #{item.name} | Number of items: #{data.size}

    "
  end
end

def display_labels(data, category)
  puts "List of #{category}"
  data.each_with_index do |item, index|
    puts "#{index})  Title: #{item.title} | Number of items: #{data.size}

    "
  end
end

def display_authors(data, category)
  puts "List of #{category}"
  data.each_with_index do |item, index|
    puts "#{index})  First name: #{item.first_name} | Last name: #{data.last_name}

    "
  end
end
