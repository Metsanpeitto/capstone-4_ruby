require_relative './texts'
require_relative './list_items/list_items'
require_relative './add_item/add_item'
require_relative './store/store'

class App
  include Texts
  def initialize
    @items = []
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @authors = []
    @sources = []
    @labels = []
    loop
  end

  def loop
    obtain_data
    Texts.text_intro
    number = gets.chomp
    running = true

    while running == true
      case number
      when '0'
        Texts.text_intro
        number = gets.chomp

      when '1'
        list_items('1')
        list_items('2')
        list_items('3')
        list_items('4')
        list_items('5')
        list_items('6')
        number = '0'

      when '2'
        add_item('1')
        add_item('2')
        add_item('3')
        add_item('4')
        number = '1'

      when '3'
        save_data
        running = false
      else
        Texts.text_intro
      end
    end
  end
end
