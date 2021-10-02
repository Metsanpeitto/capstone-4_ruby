class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, item)
    super(item[:id], item[:publish_date])
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = []
  end

  def can_be_archived(archive)
    @archived << archive
  end
end
