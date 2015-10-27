##Learn X in Y minutes, where X = Ruby Array/Enumerable
###Learning arrays
```ruby
browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
browsers.include?('Konqueror') #=> false
browsers.include?('IE') #=> true
```

Iterating over Arrays
```ruby
arr = [1, 2, 3, 4, 5]
arr.each { |a| print a -= 10, " " }
# prints: -9 -8 -7 -6 -5
#=> [1, 2, 3, 4, 5]
```


###Learning enumerables

all? [{ |obj| block } ] → true or false
```ruby
%w[ant bear cat].all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].all? { |word| word.length >= 4 } #=> false
[nil, true, 99].all?                              #=> false
```


Adding Items to Arrays
```ruby
arr = [1, 2, 3, 4]
arr.push(5) #=> [1, 2, 3, 4, 5]
arr << 6    #=> [1, 2, 3, 4, 5, 6]
```
Iterating over Arrays
```ruby
arr = [1, 2, 3, 4, 5]
arr.each { |a| print a -= 10, " " }
# prints: -9 -8 -7 -6 -5
#=> [1, 2, 3, 4, 5]

```
###Learning hashes

Accesing keys of hashes as symbols
```ruby
options = { font_size: 10, font_family: "Arial" }
options[:font_size]  # => 10
```
Can be created by ::new method
```ruby
grades = Hash.new
grades["Dorothy Doe"] = 9
```
Hashes are an easy way to represent data structures, such as
```ruby
books         = {}
books[:matz]  = "The Ruby Language"
books[:black] = "The Well-Grounded Rubyist"
```
Hashes are also commonly used as a way to have named parameters in functions. Note that no brackets are used below. If a hash is the last argument on a method call, no braces are needed, thus creating a really clean interface:
```ruby
Person.create(name: "John Doe", age: 27)

def self.create(params)
  @name = params[:name]
  @age  = params[:age]
end
```
Other way to create hash
```ruby
Hash["a", 100, "b", 200]             #=> {"a"=>100, "b"=>200}
Hash[ [ ["a", 100], ["b", 200] ] ]   #=> {"a"=>100, "b"=>200}
Hash["a" => 100, "b" => 200]         #=> {"a"=>100, "b"=>200}
```

compare_by_identity → hsh
```ruby
h1 = { "a" => 100, "b" => 200, :c => "c" }
h1["a"]        #=> 100
h1.compare_by_identity
h1.compare_by_identity? #=> true
h1["a".dup]    #=> nil  # different objects.
h1[:c]         #=> "c"  # same symbols are all same.
```



Creating default value for hashes without specified keys
```ruby
h = Hash.new("Go Fish")
h["a"] = 100
h["b"] = 200
h["a"]           #=> 100
h["c"]           #=> "Go Fish"
# The following alters the single default object
h["c"].upcase!   #=> "GO FISH"
h["d"]           #=> "GO FISH"
h.keys           #=> ["a", "b"]

# While this creates a new default object each time
h = Hash.new { |hash, key| hash[key] = "Go Fish: #{key}" }
h["c"]           #=> "Go Fish: c"
h["c"].upcase!   #=> "GO FISH: C"
h["d"]           #=> "Go Fish: d"
h.keys           #=> ["c", "d"]
```
Converting into hash
```ruby
Hash.try_convert({1=>2})   # => {1=>2}
Hash.try_convert("1=>2")   # => nil
```
Equality—Two hashes are equal if they each contain the same number of keys and if each key-value pair is equal to (according to Object#==) the corresponding elements in the other hash.
```ruby
h1 = { "a" => 1, "c" => 2 }
h2 = { 7 => 35, "c" => 2, "a" => 1 }
h3 = { "a" => 1, "c" => 2, 7 => 35 }
h4 = { "a" => 1, "d" => 2, "f" => 35 }
h1 == h2   #=> false
h2 == h3   #=> true
h3 == h4   #=> false
```
