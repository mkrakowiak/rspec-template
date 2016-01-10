require_relative '../../lib/polynominal.rb' 

require 'simplecov'
SimpleCov.start

describe Polynominal do

  context "initialization" do
    it 'correct data' do
      expect {
        Polynominal.new([1,2],5)
        }.to_not raise_error
    end
    
    it 'works with fractions' do
      expect {
        Polynominal.new([1,1.5],0.72)
      }.to_not raise_error
    end
    
    context 'incorrect data' do
      let(:array) { [1,2] }
      it 'coefficients array is empty' do
        expect{
          Polynominal.new([],1)
          }.to raise_error
      end
      
      it 'coefficients not an array' do
        expect {
          Polynominal.new(2,1)
          }.to raise_error
      end
      
      it 'mianownik not a number' do
        expect {
          Polynominal.new(array,'a')
          }.to raise_error
      end
      
      it 'mianownik is 0' do
        expect {
          Polynominal.new(array,0)
          }.to raise_error
      end
      
    end
  end
  
  describe "#add" do
    context "addition1" do

      let(:a) { [4] }
      let(:b) { [3] }
      let(:c) { [7] }

      it "adding constant terms (4 + 3)" do
        polynominal = Polynominal.new(a, 1)
        polynominal.add(Polynominal.new(b, 1))
        expect(
          polynominal.coefficients
        ).to match_array(Polynominal.new(c, 1).coefficients)
      end
    end

    context "addition2" do

      let(:a) { [4, 3] }
      let(:b) { [-2, 5] }
      let(:c) { [2, 8] }

      it "adding linear polynominals ( (3x+4) + (5x-2) )" do
        polynominal = Polynominal.new(a, 1)
        polynominal.add(Polynominal.new(b, 1))
        expect(
          polynominal.coefficients
        ).to match_array(Polynominal.new(c, 1).coefficients)
      end
    end

    context "addition3" do

      let(:a) { [1, -2, 4] }
      let(:b) { [-3, 5, -1] }
      let(:c) { [-2, 3, 3] }

      it "both degrees higher than 1 ( (x^2-3x+1) + (-x^2+7x-5) )" do
        polynominal = Polynominal.new(a, 1)
        polynominal.add(Polynominal.new(b, 1))
        expect(
          polynominal.coefficients
        ).to match_array(Polynominal.new(c, 1).coefficients)
      end
    end

    context "addition4" do

      let(:a) { [1] }
      let(:b) { [0, 1] }
      let(:c) { [1, 1] }

      it "adding constant term to 'x' (1 + x)" do
        polynominal = Polynominal.new(a, 1)
        polynominal.add(Polynominal.new(b, 1))
        expect(
          polynominal.coefficients
        ).to match_array(Polynominal.new(c, 1).coefficients)
      end
    end
  end
  
  describe "#multiply" do
    context "multiplication1" do

      let(:a) { [2] }
      let(:b) { [3] }
      let(:c) { [6] }

      it "multiplying singular terms (2 * 3)" do
        polynominal = Polynominal.new(a, 1)
        polynominal.multiply(Polynominal.new(b, 1))
        expect(
          polynominal.coefficients
        ).to match_array(Polynominal.new(c, 1).coefficients)
      end
    end

    context "multiplication2" do

      let(:a) { [4, 2] }
      let(:b) { [-2, 3] }
      let(:c) { [-8, 8, 6] }

      it "multiply linear polynominals ( (2x+4) * (3x-2) )" do
        polynominal = Polynominal.new(a, 1)
        polynominal.multiply(Polynominal.new(b, 1))
        expect(
          polynominal.coefficients
        ).to match_array(Polynominal.new(c, 1).coefficients)
      end
    end

    context "multiplication3" do

      let(:a) { [1, -3, 1] }
      let(:b) { [-5, 7, -1] }
      let(:c) { [-5, 22, -27, 10, -1] }

      it "multiply quadratic polynominals ( (x^2-3x+1) * (-x^2+7x-5) )" do
        polynominal = Polynominal.new(a, 1)
        polynominal.multiply(Polynominal.new(b, 1))
        expect(
          polynominal.coefficients
        ).to match_array(Polynominal.new(c, 1).coefficients)
      end
    end

    context "multiplication4" do

      let(:a) { [2] }
      let(:b) { [0, 1] }
      let(:c) { [0, 2] }

      it "multiply singular term with 'x' (1 * x)" do
        polynominal = Polynominal.new(a, 1)
        polynominal.multiply(Polynominal.new(b, 1))
        expect(
          polynominal.coefficients
        ).to match_array(Polynominal.new(c, 1).coefficients)
      end
    end
  end
  
  describe "#degree" do
    it "correct data" do
      expect(Polynominal.new([1,2,3,4],1).degree).to eq(3)
    end
    
  end
  
  describe "#multiply_number" do
    let(:polynominal1) { Polynominal.new([-1,4,6],1) }
    it 'correct multiplication' do
      polynominal1.multiply_number(0.22)
      expect(polynominal1.coefficients).to match_array([-0.22,4*0.22,6*0.22])
    end
  
    it 'error when not a number' do
      expect{polynominal1.multiply_number('1')}.to raise_error(TypeError)
    end
  end
  
  describe "#to_s" do
    it 'single term' do
      expect(Polynominal.new([1],1).to_s).to eq('1')
    end
    
    it 'only zeros' do
      expect(Polynominal.new([0,0,0,0],1).to_s).to eq('0')
    end
    
    it 'zeros at beginning' do
      expect(Polynominal.new([2,2,0,0],1).to_s).to eq('2x+2')
    end
    
    it 'zeroes at the end' do
    expect(Polynominal.new([0,0,2,0,2],1).to_s).to eq('2x^4+2x^2')
    end
    
    it 'one as a number only at the end' do
      expect(Polynominal.new([1,1],1).to_s).to eq('x+1')
    end
    
    it 'minus one' do
      expect(Polynominal.new([-1,-1,-1],1).to_s).to eq('-x^2-x-1')
    end
    
    it 'rounds fraction to 5 digits' do
      expect(Polynominal.new([0.55555555,10.444444],1).to_s).to eq('10.44444x+0.55556')
    end

  end
  
  describe "#is_zero" do
    it "is zero" do
      expect(Polynominal.new([0,0],1).is_zero).to be true
    end
    
    it "is not zero" do
      expect(Polynominal.new([0,0,-1],1).is_zero).to be_falsey
    end
  end
  
  describe ".is_polynominal" do
    let(:instance1) { instance_double('Polynominal2', coefficients: [1,2,3], degree:2) }
    let(:instance2) { instance_double('Polynominal2', coefficients: [1,2,'a']) }
    let(:instance3) { instance_double('Polynominal2', coefficients: [1,2], add: 3, multiply: 2, degree: 1, multiply_number: [2,4], is_zero: false, to_s: '2x+1') }
    let(:instance4) { instance_double('Polynominal2', coefficients: [1,2], add: 3, multiply: 2, degree: 1, multiply_number: [2,4], is_zero: false, to_s: '2x+1', fun: true) }

    it 'data with mistakes' do 
      expect(Polynominal.is_polynominal(instance2)).to be_falsey
    end
    
    it 'not all functions implemented' do
      expect(Polynominal.is_polynominal(instance1)).to be_falsey
    end
    
    it 'correct data' do
      expect(Polynominal.is_polynominal(instance3)).to be true
    end

    it 'work with additional functions' do
      expect(Polynominal.is_polynominal(instance4)).to be true
    end

  end
  
end
