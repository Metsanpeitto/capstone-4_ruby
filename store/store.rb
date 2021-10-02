require 'json'
require './classes/categories/book'

def get_path(path)
  data_hash = nil
  if Dir.exist?('./store') && !File.zero?(path)
    raw = File.open(path)
    file = File.read(raw)
    data_hash = JSON.parse(file) if file != ''
  end
  data_hash
end

def set_path(category, data)
  File.write(category, JSON.dump(data))
end

def save_data
  books_json = items_2_json(@books)
  game_json = items_2_json(@games)
  movie_json = items_2_json(@movies)
  music_album_json = items_2_json(@music_album)

  set_path('./store/books.json', books_json) if books_json.size.positive?
  set_path('./store/games.json', game_json) if game_json.size.positive?
  set_path('./store/movies.json', movie_json) if movie_json.size.positive?
  set_path('./store/music_albums.json', music_album_json) if music_album_json.size.positive?
end

def obtain_data
  books = get_path('./store/books.json')
  games = get_path('./store/games.json')
  movies = get_path('./store/movies.json')
  music_albums = get_path('./store/music_albums.json')
  if books.empty?
    puts "Can't find any stored book"
  else
    json_2_obj(books)
    puts 'Loaded books'
  end
  if games.empty?
    puts "Can't find any stored game"
  else
    json_2_obj(games)
    puts 'Loaded books'
  end
  if movies.empty?
    puts "Can't find any stored movie"
  else
    json_2_obj(movies)
    puts 'Loaded books'
  end
  if music_albums.empty?
    puts "Can't find any stored music album"
  else
    json_2_obj(music_albums)
    puts 'Loaded books'
  end
end

def items_2_json(args)
  items = []
  args.class
  if args
    args.each do |o|
      item = item_2_json(o)
      items.push(item)
    end
  end
  items
end

def item_2_json(item)
  item.to_json(item)
end

def json_2_obj(item)
  puts item
  item.json_create(item)
  puts 'Data loaded'
end
