require './classes/attributes/genre'
require './classes/attributes/author'
require './classes/attributes/source'
require './classes/attributes/label'
require './classes/item'

describe Item do
  before :each do
    @item = Item.new(Time.now.to_i, '2000-10-10', true)
    @source = Source.new('Shop')
    @genre = Genre.new('Drama')
    @author = Author.new('John', 'wilkings')
    @label = Label.new('The label', 'Red')
  end

  describe 'test its methods' do
    it 'returns #move_to_archive equals "true"' do
      expect(@item.archived).to(eq(true))
    end
    it 'returns #add_source matches ' do
      expect(@item.source = @source).to(eq(@item.source))
    end
    it 'returns #add_genre matches @genre' do
      expect(@item.genre = @genre).to(eq(@item.genre))
    end
    it 'returns #add_author matches ' do
      expect(@item.author = @author).to(eq(@item.author))
    end

    it 'returns #add_label matches ' do
      expect(@item.label = @label).to(eq(@item.label))
    end
  end
end
