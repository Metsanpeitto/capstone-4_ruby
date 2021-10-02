class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = Time.now.to_i
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
