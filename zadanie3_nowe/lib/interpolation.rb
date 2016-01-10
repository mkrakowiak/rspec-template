#!/usr/bin/env ruby
require_relative 'polynominal'
require_relative 'multiplier'

class Interpolation
  attr_accessor :tab_X, :tab_Y, :lagrange
  def initialize(tabX, tab_Y)
    if is_correct_X(tabX)
      @tab_X = tabX
    else
      raise ArgumentError.new('X is not correct')
    end
    
    if is_correct_Y(tab_X,tab_Y)
      @tab_Y = tab_Y
    else
      raise ArgumentError.new('Y is not correct')
    end
    @lagrange = Multiplier.new(tab_X)
  end
  
  def interpolate
    result_polynominal = initialize_with_zeros
    (0..result_polynominal.degree).each { |i|
      interpolation_sum(result_polynominal,lagrange.l[i],tab_Y[i])
    }
    (0..result_polynominal.degree).each { |i|
      result_polynominal.coefficients[i] = result_polynominal.coefficients[i].round(+5)
    }
    result_polynominal
  end

  def interpolation_sum(interpolation,li,yi)
    (0..interpolation.degree).each { |i|  
      interpolation.coefficients[i] = (interpolation.coefficients[i] + yi * li.coefficients[i])#.round(+5)  
    }
  end
  
  private
  def is_correct_X(x)
    if !x.is_a? Enumerable
      return false
    end
    
    if x.length < 1
      return false
    end
    
    if !is_X_distinct_number(x)
      return false
    end
    
    true
  end
  
  def is_correct_Y(x,y)
    if !y.is_a? Enumerable
      return false
    end
    
    if y.length != x.length
      return false
    end
    
    y.each { |el|
      if !el.is_a? Numeric
        return false
      end
    }
    true
  end
  
  def is_X_distinct_number(x)
    i = x.count-1 
    result = true
    while i >= 1 and result
      if !x[i].is_a? Numeric
        return false
      end
      
      result = is_value_distinct(x.first(i-1),x[i])
      i = i - 1
    end
    result
  end
  
  def is_value_distinct(enum,value)
    if enum.find_index(value).eql? nil
      true
    else
      false
    end
  end
  
  def initialize_with_zeros
    result = Array.new(tab_X.length,0)
    Polynominal.new(result,1)
  end
end
