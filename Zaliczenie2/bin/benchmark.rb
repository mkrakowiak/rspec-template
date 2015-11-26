#! /usr/bin/env ruby

require 'benchmark'
require '../lib/quick_2'
require '../lib/heap'
require '../lib/bubble'
require '../lib/merge'
require '../lib/insertion'

array100 = (1..100).map { rand }
array1000 = (1..1000).map { rand }
array10000 = (1..10000).map { rand }

n = 100

puts "\n"
puts 'Quicksort on different array lengths'
Benchmark.bmbm do |x|
    x.report("Length = 100") { n.times do ; sort(array100, 0, array100.length - 1); end }
    x.report("Length = 1000") { n.times do ; sort(array1000, 0, array1000.length - 1); end }
end

puts "\n"
puts 'Heapsort on different array lengths'
Benchmark.bmbm do |x|
    x.report("Length = 100") { n.times do ; heap_sort(array100); end  }  
    x.report("Length = 1000") { n.times do ; heap_sort(array1000); end  }
end

puts "\n"
puts 'Mergesort on different array lengths'
Benchmark.bmbm do |x|
    x.report("Length = 100") { n.times do ; merge_sort(array100); end  }  
    x.report("Length = 1000") { n.times do ; merge_sort(array1000); end  }
end

puts "\n"
puts 'Instertion on different array lengths'
Benchmark.bmbm do |x|
    x.report("Length = 100") { n.times do ; insertion_sort(array100); end  }  
    x.report("Length = 1000") { n.times do ; insertion_sort(array1000); end  }
end

puts "\n"
puts 'Bubble on different array lengths'
Benchmark.bmbm do |x|
    x.report("Length = 100") { n.times do ; bubble_sort(array100); end  }  
    x.report("Length = 1000") { n.times do ; bubble_sort(array1000); end  }
end



