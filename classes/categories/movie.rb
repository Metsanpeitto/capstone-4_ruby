class Movie < Item
  attr_accessor :silent

  def initialize(silent, item)
    super(item[:id], item[:publish_date])
    @silent = silent
    @archived = []
  end

  def can_be_archived(archive)
    @archived << archive
  end
end
