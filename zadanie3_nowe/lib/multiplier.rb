#!/usr/bin/env ruby
require_relative 'polynominal'

class Multiplier
  
  attr_accessor :l

  def initialize(nodes)
    @nodes = nodes

    @l = Array.new(nodes.length, nil)
    denominators = Array.new(nodes.length, 1)
    (0..@nodes.length - 1).each do |i|
      (0..@nodes.length - 1).each do |k|
        if (i != k)
          if (@l[i] == nil)
            @l[i] = Polynominal.new([-@nodes[k], 1], @nodes[i] - @nodes[k])
            denominators[i] = @nodes[i] - @nodes[k]
            next
          end
          @l[i].multiply(Polynominal.new([-@nodes[k], 1], @nodes[i] - @nodes[k]))
          denominators[i] = denominators[i] * (@nodes[i] - @nodes[k])
        end
      end
    end
  
    (0..l.length-1).each { |index|
      l[index].multiply_number(1.0/denominators[index])
    }
  end

end
