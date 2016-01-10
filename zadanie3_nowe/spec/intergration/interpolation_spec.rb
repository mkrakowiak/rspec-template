require 'spec_helper'

describe Interpolation do
  
  describe "#interpolate" do
    let (:interpolate1) { Interpolation.new([0,1,2],[0,1,2])} 
    let (:interpolated) {interpolate1.interpolate }
	
    it 'lagrange instance of Multiplier' do
      expect(interpolate1.lagrange).to be_a(Multiplier)
    end
    
    it 'correct lagrange' do
        (0..2).each do |i|
          expect(interpolate1.lagrange.l[i].coefficients).to match_array(Multiplier.new([0,1,2]).l[i].coefficients)
          expect(interpolate1.lagrange.l[i].wMianownik).to eq(Multiplier.new([0,1,2]).l[i].wMianownik)
        end
    end
    
    it 'interpolate instance of Polynominal' do
      expect(interpolated).to be_a(Polynominal)
    end
    
    let (:x) {[0,1,2,3]}
    let (:y) {[1,2,3,9]}
    let (:interpolate2) {Interpolation.new(x,x).interpolate}
    let (:interpolate3) {Interpolation.new(x,y).interpolate}
  
    it 'initialization eq x' do
      expect(interpolate2.to_s).to eq('x')
      expect(interpolate2.coefficients).to match_array([0,1,0,0])
    end
  
    it 'p(x)' do
      expect(interpolate3.to_s).to eq('0.83333x^3-2.5x^2+2.66667x+1.0')
      expect(interpolate3.coefficients).to match_array([1,(8.0/3).round(+5),(-5.0/2).round(+5),(5.0/6).round(+5)])
    end
  end
end
