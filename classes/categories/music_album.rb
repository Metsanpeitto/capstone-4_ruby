class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, item)
    super(item[:id], item[:publish_date])
    @on_spotify = on_spotify
    @archived = []
  end

  def can_be_archived(archive)
    @archived << archive
  end
end
