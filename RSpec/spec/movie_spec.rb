require './classes/categories/movie'
require './classes/item'

describe Movie do
  before :each do
    item = { id: Time.now.to_i, publish_date: '2000-10-10', archived: true }
    @movie = Movie.new(true, item)
  end

  describe '#test methods of class movie' do
    it 'returns #silent equals "true"' do
      expect(@movie.silent).to(eq(true))
    end
    it 'returns true if publish_date is more than 10 years' do
      expect(@movie.can_be_archived).to(eq(true))
    end
  end
end
