require File.expand_path '../../spec_helper.rb', __FILE__

describe "URL" do
  describe "#uid" do
    it 'returns base58 encoded ID string' do
      url = Url.new(id: 12345)
      expect(url.uid).to eq('4ER')

      url = Url.new(id: 1)
      expect(url.uid).to eq('2')
    end

    it 'returns nil if ID is nill' do
      url = Url.new
      expect(url.uid).to eq(nil)
    end
  end
end
