require './classes/attributes/source'
require './classes/item'

describe Source do
  before :each do
    @item = Item.new(Time.now.to_i, '2000-10-10', true)
    source = Source.new('Shop')
    @item.source = source
  end

  describe '#test methods of class source' do
    it 'returns #source name matches "Shop"' do
      expect(@item.source.name).to(eq('Shop'))
    end
  end
end
