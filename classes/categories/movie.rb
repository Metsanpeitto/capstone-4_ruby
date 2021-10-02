class Movie < Item
  attr_accessor :silent

  def initialize(silent, item)
    super(item[:id], item[:publish_date])
    @silent = silent
  end

  def can_be_archived
    response false
    response = true if super.can_be_archived || @silent == true
    response
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [id: @id,
                 silent: @silent,
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
