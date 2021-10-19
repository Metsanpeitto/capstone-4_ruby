require './classes/categories/game'
require './classes/item'

describe Game do
  before :each do
    item = { id: Time.now.to_i, publish_date: '2000-10-10', archived: true }
    @game = Game.new(true, '2000-10-10', item)
  end

  describe '#test methods of class game' do
    it 'returns #multiplayer equals "true"' do
      expect(@game.multiplayer).to(eq(true))
    end
    it 'returns #last_played_at" matches "2000-10-10' do
      expect(@game.last_played_at).to(eq('2000-10-10'))
    end
    it 'returns true if publish_date is more than 10 years' do
      expect(@game.can_be_archived).to(eq(true))
    end
  end
end
