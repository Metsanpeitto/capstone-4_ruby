require './classes/attributes/genre'
require './classes/item'

describe Genre do
  before :each do
    @item = Item.new(Time.now.to_i, '2000-10-10', true)
    @genre = Genre.new('Terror')
    @item.genre = @genre
  end

  describe '#test methods of class genre' do
    it 'returns #name matches "Terror"' do
      expect(@item.genre.name).to(eq('Terror'))
    end
    it 'returns #@items[0] matches "@items"' do
      expect(@genre.items[0]).to(eq(@item))
    end
  end

end
