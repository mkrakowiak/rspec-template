#!/usr/bin/env ruby
class Polynominal

  attr_accessor :coefficients, :wMianownik
  
  def initialize(coefficients)
    @coefficients = coefficients
  end
  
  def initialize(coefficients, mianownik)
    if is_correct_coefficients(coefficients)
      @coefficients = coefficients
    else
      raise ArgumentError.new('coefficients are not correct')
    end
    
    if is_correct_mianownik(mianownik)
      @wMianownik = mianownik    
    else
      raise ArgumentError.new('mianownik is not correct')
    end
  end

  def add(w)              
    length = 0

    if @coefficients.length > w.coefficients.length
      (w.coefficients.length..@coefficients.length-1).each do |i|
        w.coefficients.push(0)
      end
    else
      length = w.coefficients.length
      (@coefficients.length..w.coefficients.length-1).each do |i|
        @coefficients.push(0)
      end
    end

    (0..length - 1).each do |i|
      @coefficients[i] = @coefficients[i] + w.coefficients[i]
    end

  end

  def multiply(w)
    degreeMax = (@coefficients.length) + (w.coefficients.length)
    resultCoefficients = Array.new(degreeMax - 1, 0)

    (0..@coefficients.length-1).each do |i|
      (0..w.coefficients.length-1).each do |j|
        resultCoefficients[(@coefficients.length-1-i) + (w.coefficients.length-1-j)] = resultCoefficients[(@coefficients.length-1-i) + (w.coefficients.length-1-j)] + (@coefficients[@coefficients.length-1-i] * w.coefficients[w.coefficients.length-1-j])

      end
    end
    @coefficients = resultCoefficients
  
  end
  
  def degree
    coefficients.count-1
  end
  
  def multiply_number(number)
    if !number.is_a? Numeric
      raise TypeError.new('argument is not a number!')
    end
  
    (0..coefficients.length-1).each { |index|
      coefficients[index] = coefficients[index] * number
    }
  end
  
  def to_s
    if is_zero
      return '0'
    end
    
    result = ''
    i = coefficients.length - 1
  
    while coefficients[i] == 0
      i = i - 1
    end  
    
    result<<first_term_to_s(i)
    i = i - 1
    
    while i >= 0
      result<<next_term_to_s(i)
      i = i - 1
    end
    result
  end
  
  def is_zero
    coefficients.each { |value|
      if value != 0
        return false
      end
    }
    true
  end
  
  def self.is_polynominal(arg)
    if !arg.respond_to?(:coefficients) and is_correct_coefficients(arg.coefficients)
      return false
    end
    
    if !arg.respond_to?(:add)
      return false
    end
    
    if !arg.respond_to?(:multiply)
      return false
    end
    
    if !arg.respond_to?(:degree)
      return false
    end
    
    if !arg.respond_to?(:multiply_number)
      return false
    end
    
    if !arg.respond_to?(:is_zero)
      return false
    end
    
    if !arg.respond_to?(:to_s)
      return false
    end
    
    true
  end
  
  private
  def first_term_to_s(power)
    coefficient_to_s(power) << power_to_s(power)
  end
  
  def next_term_to_s(power)
    plus_to_s(coefficients[power]) << first_term_to_s(power)
  end
  
  def power_to_s(power)
    if coefficients[power] == 0 
      return ''
    end
    if  power > 1 
      return 'x^'<<power.to_s
    elsif power == 1
      return 'x'
    end
    ''
  end
  
  def coefficient_to_s(power)
    if power > 0
      if coefficients[power] == -1
        return '-'
      elsif coefficients[power] != 1 and coefficients[power] != 0
        return rounded_value_to_s(coefficients[power])
      end
    elsif coefficients[power] != 0
      return rounded_value_to_s(coefficients[power])
    end
    ''
  end
  
  def rounded_value_to_s(value)
    if value.to_s.length > 5
      value.round(+5).to_s
    else
      value.to_s
    end
  end
  
  def plus_to_s(value)
    if value > 0
      '+'
    else
      ''
    end
  end
  
  def is_correct_coefficients(coeff)
    if coeff.is_a? Enumerable
      if !is_empty_enumerable(coeff) 
        return true
      end
    end
    false
  end
  
  def is_correct_mianownik(mian)
    if mian.is_a? Numeric
      if mian != 0
        return true
      end
    end
    false
  end
  
  def is_empty_enumerable(coeff)
    if coeff.eql? []
      true
    else
      false
    end
  end
end
