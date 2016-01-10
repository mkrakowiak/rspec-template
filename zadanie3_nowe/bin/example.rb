#!/usr/bin/ruby
require_relative '../lib/interpolation'

x1 = Array.new([1,5,8,9])
x2 = Array.new([1,5,8,9])
y1 = Array.new([-1,2,3,5])
i = Interpolation.new(y1,y1)
inter1 = i.interpolate
inter2 = Interpolation.new(x1,y1).interpolate
puts "\nProgram ilustrujący wywołanie i działanie klas Interpolation, Multiplier i Polynominal"
puts "\n\nprogram wykonany dla tablic X=[1,5,8,9], Y=[-1,2,3,5]"
puts "\npierwszy mnożnik lagrange'a"
puts i.lagrange.l[0].to_s
puts "\ndrugi mnożnik lagrange'a"
puts i.lagrange.l[1].to_s
puts "\ninterpolacja punktów z tablic X i Y"
puts inter2.to_s
puts "\ninterpolacja punktów z tablic Y i Y(punkty identycznościowe)"
puts inter1.to_s
