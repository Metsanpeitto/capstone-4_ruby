require './classes/author'

describe Author do
  context 'Test the methods by' do
    it 'add item to the items array ' do
      item = Item.new(TimeDate.now, TimeDate.today)
      item = {}
      expect(book.author).to(eq('the author'))
    end
  end
end
