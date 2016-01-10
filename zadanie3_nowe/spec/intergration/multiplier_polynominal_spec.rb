require 'spec_helper'

describe Multiplier do
  context "initialization" do
    let (:x) { [-1,0,1,2]}
    let (:result1) { Multiplier.new(x)}
    it 'Multiplier instance of Polynominal' do
      expect(result1.l[0]).to be_a(Polynominal)
      expect(result1.l[1]).to be_a(Polynominal)
      expect(result1.l[2]).to be_a(Polynominal)
      expect(result1.l[3]).to be_a(Polynominal)
    end
  end
end
