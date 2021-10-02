class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, item)
    super(item[:id], item[:publish_date])
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived
    response false
    response = true if super.can_be_archived || ((Time.now - @last_played_at) / 1.year).round > 2
    response
  end

    def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [id: @id,                
                 multiplayer: @multiplayer,
                 last_played_at: @last_played_at,
                 archived: @archived,
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
    new(*object['a'])
  end
end
