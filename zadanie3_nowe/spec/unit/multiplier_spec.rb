require_relative '../../lib/multiplier.rb' 
require_relative '../../lib/polynominal.rb' 

describe Multiplier do

  describe "#initialization" do
    it 'error when no arguments' do
      expect {
        Multiplier.new
        }.to raise_error
    end
    let(:x) { [-1, 0, 1, 2] }
    it 'correct with one argument' do
      expect {
        Multiplier.new(x)
      }.to_not raise_error
    end
    
    it 'correct lagrange multiplier' do
      multiplier = Multiplier.new(x)
      expect(        
        multiplier.l[0].coefficients
      ).to match_array([0, 1.0/-6, -3.0/-6, 2.0/-6])
    end
  end

end
