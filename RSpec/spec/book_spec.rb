require './classes/book'

describe Book do
  context 'Given arguments to initialize the class' do
    it 'add title and author' do
      book = Book.new('the tile', 'the author')
      expect(book.author).to(eq('the author'))
    end
  end
end
