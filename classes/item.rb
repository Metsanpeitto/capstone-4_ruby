class Item
  attr_reader :genre, :author, :source, :label

  def initialize(id, publish_date)
    @id = id
    @genre
    @author
    @source
    @label
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    @genre.add_item(self)
  end

  def author=(author)
    @author = author
    @author.add_item(self)
  end

  def source=(source)
    @source = source
    @source.add_item(self)
  end

  def label=(label)
    @label = label
    @label.add_item(self)
  end

  def can_be_archived?
    ((Time.now - @publish_date) / 1.year).round > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
