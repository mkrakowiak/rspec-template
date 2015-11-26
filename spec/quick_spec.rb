require 'simplecov'
SimpleCov.start

require 'quick_2'


describe '#sort' do
  it 'should be defined' do
    expect { sort([1, 2, 3])}.not_to raise_error
  end
  it 'returns the array sort' do
      expect(sort([1, 4, 3])).to eq([1,3,4])
      expect(sort([1, 4, 3,99,22,33,12,-9,3,1,5,7,23,4,5,2])).to eq([-9, 1, 1, 2, 3, 3, 4, 4, 5, 5, 7, 12, 22, 23, 33, 99])
      expect(sort([1.9, 4, 3])).to eq([1.9,3,4])
      expect(sort([1, 4, -3.2,99,22,33,12.9,-9,3,1,5,0,7,23,4,5,2])).to eq([-9,-3.2,0, 1, 1, 2, 3, 4, 4, 5, 5, 7, 12.9, 22, 23, 33, 99])
      expect([99, 2, 3]).to match_array([2, 3, 99])
      expect([3]).to match_array([3])
    end
  it 'returns the empty array' do
    expect(sort([])).to eq([])
end
end
