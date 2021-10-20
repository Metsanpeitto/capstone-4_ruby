require './classes/categories/game'
require './classes/item'

describe Game do
  before :each do
    item = { id: Time.now.to_i, publish_date: '2000-10-10', archived: true }
    @game = Game.new(true, '2009-10-10', item)
  end

  describe '#test methods of class game' do
    it 'returns #multiplayer equals "true"' do
      expect(@game.multiplayer).to(eq(true))
    end
    it 'returns #last_played_at" matches "2000-10-10' do
      expect(@game.last_played_at).to(eq('2009-10-10'))
    end
    it 'returns true if publish_date is more than 10 years' do
      expect(@game.can_be_archived).to(eq(true))
    end
    it 'when published over 10 years ago and last played over 2 years' do
      expect(@game.can_be_archived).to(eq(true))
    end
    it 'when published less than 10 years ago and last played over 2 years' do
      item = { id: Time.now.to_i, publish_date: '2020-10-10' }
      @game = Game.new(true, '2021-10-10', item)
      expect(@game.can_be_archived).to(eq(false))
    end
  end
end
