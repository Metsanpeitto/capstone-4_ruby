class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, item)
    super(item[:id], item[:publish_date])
    @publisher = publisher
    @cover_state = cover_state
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
                 archived: @archived,
                 publisher: @publisher,
                 cover_state: @cover_state,
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
    puts new(*object['a'])
  end
end
