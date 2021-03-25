```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

# Breakdown

Start - multidimensional array

1. Method ```map``` is called on the array.
2. ```map``` passes control to a block, also passing subarray ```arr``` into the block.
    a. ```first``` is called on ```arr```, pulling the element from index 0 of the subarray and returning it.
    b. ```puts``` takes the return value from step a., outputs the value to stdout, and returns ```nil``` (value not used by program).
    c. ```first``` is called on ```arr```, pulling the element from index 0 of the subarray and returning it.
    d. The block takes the return value from step c. and passes it back to the method.
3. ```map``` accepts the return value of the block (element 0 of the subarray).
4. ```map``` repeats the process for each subarray within the multidimensional array, returning a new array (size = size multidimensional array, each cell value @index 0 of each subarray).
5. The new array's value us returned, but not use.

Line | Action | Object | Side Effects | Return Value | Is Return Value Used?
--- | --- | --- | --- | --- | ---| ---
1 | method call ```map``` | multidimensional array | none | new array = [1, 3] | no
1-4 | block | subarray ```arr``` | none | 1, 3 (first values from subarrays) | Yes, by ```map``` method for transformation
2 | method call ```first``` | subarray ```arr``` | none | element @index 0 of ```arr``` | Yes, by ```puts``` on same line
2 | method call ```puts``` | return of row above (0 index element of ```arr```) | prints object called on to stdout | ```nil``` | no
3 | method call ```first``` | subarray ```arr``` | none | element @index 0 of ```arr``` | Yes, used as return value of block
