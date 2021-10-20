require './classes/categories/music_album'
require './classes/item'

describe MusicAlbum do
  before :each do
    item = { id: Time.now.to_i, publish_date: '2000-10-10', archived: true }
    @music_album = MusicAlbum.new(true, item)
  end

  describe '#test methods of class music_album' do
    it 'returns #on_spotify equals "true"' do
      expect(@music_album.on_spotify).to(eq(true))
    end
    it 'returns true if publish_date is more than 10 years' do
      expect(@music_album.can_be_archived).to(eq(true))
    end
    it 'when published less than 10 years ago and on Spotify' do
      item = { id: Time.now.to_i, publish_date: '2018-10-10', archived: true }
      @music_album = MusicAlbum.new(true, item)
      expect(@music_album.can_be_archived).to(eq(false))
      expect(@music_album.on_spotify).to(eq(true))
    end
    it 'when on Spotify' do
      expect(@music_album.on_spotify).to(eq(true))
    end
  end
end
