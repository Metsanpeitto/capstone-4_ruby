require 'date'
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
    @archived_items = []
    loop
  end
# rubocop:disable all
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
        list_items
        number = '0'

      when '2'
        add_item
        number = '0'

      when '3'
        save_data
        running = false

      when '4'
        puts 'Input the command'
        code = gets.chomp
        # rubocop:disable all
        eval(code)
        # rubocop:enable all
        number = '0'
      end
    end
  end
end
# rubocop:enable all
