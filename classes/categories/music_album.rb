class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, item)
    super(item[:id], item[:publish_date])
    @on_spotify = on_spotify
  end

  def can_be_archived
    response false
    response = true if super.can_be_archived || @cover_state == 'bad'
    response
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [id: @id,
                 on_spotify: @on_spotify,
                 genre_name: @genre.name,
                 author_first_name: @author.first_name,
                 author_last_name: @author.last_name,
                 source_name: @source.name,
                 label_title: @label.title,
                 label_color: @label.color]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    puts object
    new(*object['data'])
  end
end
