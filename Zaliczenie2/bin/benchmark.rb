#! /usr/bin/env ruby

require 'benchmark'
require '../lib/quick_sort'
require '../lib/heap_sort'

array100 = (1..100).map { rand }
array1000 = (1..1000).map { rand }
array10000 = (1..10000).map { rand }

n = 100

puts "\n"
puts 'Quicksort on different array lengths, performed 100 times'
Benchmark.bmbm do |x|
    x.report("Length = 100") { n.times do ; quickSort(array100, 0, array100.length - 1); end }
    x.report("Length = 1000") { n.times do ; quickSort(array1000, 0, array1000.length - 1); end }
end

puts "\n"
puts 'Heapsort on different array lengths, performed 100 times'
Benchmark.bmbm do |x|
    x.report("Length = 100") { n.times do ; heapsort(array100, array100.length); end  }  
    x.report("Length = 1000") { n.times do ; heapsort(array1000, array1000.length); end  }
end
