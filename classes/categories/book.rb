class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, item)
    super(item[:id], item[:publish_date])
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived(archive)
    response false
    response = true if super.can_be_archived || @cover_state == 'bad'
    response
  end
end
