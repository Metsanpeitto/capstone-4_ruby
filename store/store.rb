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
  File.write(category, nil, mode: 'w')
  File.write(category, JSON.dump(data), mode: 'w')
end

def save_data
  if @books.size.positive?
    books_json = items_2_json(@books)
    set_path('./store/books.json', books_json) if books_json.size.positive?
  end

  if @games.size.positive?
    game_json = items_2_json(@games)
    set_path('./store/games.json', game_json) if game_json.size.positive?
  end

  if @movies.size.positive?
    movie_json = items_2_json(@movies)
    set_path('./store/movies.json', movie_json) if movie_json.size.positive?
  end

  if @music_albums.size.positive?
    music_album_json = items_2_json(@music_albums)
    set_path('./store/music_albums.json', music_album_json) if music_album_json.size.positive?
  end
end

def obtain_data
  books = get_path('./store/books.json')
  games = get_path('./store/games.json')
  movies = get_path('./store/movies.json')
  music_albums = get_path('./store/music_albums.json')

  json_2_obj(JSON[books]) if books

  json_2_obj(JSON[games]) if games

  json_2_obj(JSON[movies]) if movies

  json_2_obj(JSON[music_albums]) if music_albums
end

def items_2_json(args)
  items = []
  args&.each_with_index do |o, _index|
    # item = item_2_json(o)
    items.push(o)
  end
  if items.size.positive?
    JSON.generate(items)
  else
    items = nil
  end
end

def item_2_json(item)
  item.to_json(item)
end

def json_2_obj(json_array)
  json_array&.each do |json|
    # json = JSON.parse(raw)
    key = json['json_class']
    data = json['data']
    item_data = { id: data[0]['id'],
                  archived: data[0]['archived'],
                  genre_name: data[0]['genre_name'],
                  author_first_name: data[0]['author_first_name'],
                  author_last_name: data[0]['author_last_name'],
                  source_name: data[0]['source_name'],
                  label_title: data[0]['label_title'],
                  label_color: data[0]['label'] }
    item = nil
    if key == 'Book'
      item = Book.new(data[0]['publisher'], data[0]['cover_state'], item_data)
      new_item = addAttributes(item, item_data)
      @books << new_item
    end

    if key == 'Movie'
      item = Movie.new(data[0]['silent'], item_data)
      new_item = addAttributes(item, item_data)
      @movies << new_item
    end

    if key == 'Game'
      item = Game.new(data[0]['multiplayer'], data[0]['last_played_at'], item_data)
      new_item = addAttributes(item, item_data)
      @games << new_item
    end

    next unless key == 'MusicAlbum'

    item = MusicAlbum.new(data[0]['on_spotify'], item_data)
    new_item = addAttributes(item, item_data)
    @music_album << new_item
  end
end

def addAttributes(item, item_data)
  new_label = Label.new(item_data[:label_title], item_data[:label_color])
  new_source = Source.new(item_data[:source_name])
  new_genre = Genre.new(item_data[:genre_name])
  new_author = Author.new(item_data[:author_first_name], item_data[:author_last_name])

  @labels << new_label unless @labels.any? { |l| l.title == new_label.title }
  @sources << new_source unless @sources.any? { |s| s.name == new_source.name }
  @authors << new_author unless @authors.any? { |a| a.first_name == new_author.first_name }
  @genres << new_genre unless @genres.any? { |g| g.name == new_genre.name }

  item.label = new_label
  item.source = new_source
  item.genre = new_genre
  item.author = new_author
  item
end
