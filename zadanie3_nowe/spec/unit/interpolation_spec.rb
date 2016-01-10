require 'spec_helper'

require 'simplecov'
SimpleCov.start

require_relative '../../lib/interpolation'

describe Interpolation do

  context "initialization" do
    let(:tab_x2){[1,2,3]}
    let(:tab_y2){[2,3,4]}
    
    it 'initialize with 2 arguments' do
      expect { Interpolation.new(tab_x2, tab_y2) }.to_not raise_error
    end
    
    it 'work when values in Y not distinct' do
      expect { Interpolation.new(tab_x2,[1,1,1]) }.to_not raise_error
    end
    
    context 'incorrect data' do
      let(:tab_x3){[-0.3,0.7]}
      let(:tab_y3){[0,1/3]}
      
      it 'not initialize with 1 argument' do
        expect { Interpolation.new(tab_x2) }.to raise_error(ArgumentError)
      end
      
      it 'not initialize with empty array' do 
        expect { Interpolation.new([],[]) }.to raise_error(ArgumentError)
      end
      
      context 'in X' do
        it 'not work with non-enumerable' do
          expect { Interpolation.new(1,2)}.to raise_error(ArgumentError)
        end
        
        it 'values not distinct' do
          expect { Interpolation.new([1,2,1],tab_y2) }.to raise_error(ArgumentError)
        end
        
        it 'not all values numbers' do
          expect { Interpolation.new([1,'a'],tab_y3) }.to raise_error(ArgumentError)
        end
      
      end
      
      context 'in Y' do
        it 'not all values numbers' do
          expect { Interpolation.new(tab_x3,[1,[2,3]]) }.to raise_error(ArgumentError)
        end
        
        it 'different than the lenght of X' do
          expect { Interpolation.new(tab_x2,tab_y3) }.to raise_error(ArgumentError)
        end
      end
      
    end
  end
  
end
