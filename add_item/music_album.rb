require_relative '../texts'
require_relative '../classes/categories/music_album'

def create_music_album(item)
  Texts.text_ci3('album', 'on spotify (y/n)?')
  answer = gets.chomp
  # answer = 'y'
  on_spotify = false
  on_spotify = true if answer == 'y'
  music_album = MusicAlbum.new(on_spotify, item)
  @music_albums << music_album
  Texts.success('music album')
  music_album
end
