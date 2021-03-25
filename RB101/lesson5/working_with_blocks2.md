# Breakdown
```ruby    
my_arr = [[18, 7], [3, 12]].each do |arr|    
  arr.each do |num|    
    if num > 5    
      puts num    
    end    
  end    
end    
```

## Output

```
18
7
12
=> [[18, 7], [3, 12]]
```

## Breakdown

1. Method call ```each``` on **multidimensional array** (```[[18, 7], [3, 12]]```), indexed objects (each an **inner array**) passed to block as variable ```arr```
>  1. Method call ```each``` on **inner array** ```arr```, indexed objects (each an **inner number**) passed to block as variable ```num```
  > > 1. **Comparison** check whether ```num``` is greater than 5, returns true if ```num``` is greater, false otherwise.
  > > 2. ```if``` conditional takes return of comparison above and...
    > > > 1. If **comparison** ```true```:
      > > > > 1. Method call ```puts``` on ```num```, converting  ```num``` to string and printing to stdout/terminal, after which ```puts``` returns ```nil``` to ```if```.
    > > > 2. If **comparison** ```false```:
      > > > > 1. Nothings happens (there being no ```elsif``` or ```else```), and the default value of ```nil``` is returned to ```if```.
  > > 3. ```if``` conditional returns its value (in this case always ```nil```), in this case to the block due to ```if``` being the last line in the block.
  > > 4. The block passes its return object (```nil``` for all iterations) to the ```each``` statement that yielded to it (note though that ```each``` does nothing with the object).
> 2. The inner ```each``` returns the original array **inner array** object ```arr``` it was called on to the block it was nested inside (as the this inner ```each``` statement is the last line of the outer ```each```'s block).
> 3. The outer block passes the returned **inner array** object ```arr``` back to the outer ```each``` statement that yielded to it (note though that ```each``` does nothing with the object).
2. The outer ```each``` statement returns the original **multidimensional array** (```[[18, 7], [3, 12]]```), which is then assigned to the variable ```my_arr```

Line | Action | Object | Side Effect | Return Value | Return Value Used?
---| --- | --- | --- | --- | ---
1 | method call ```each``` | multidimensional array | none | original array | Yes, stored and pointed to by var ```my_arr```
1-7 | block execution | inner array ```arr``` passed to by ```each``` method | none | inner array ```arr``` | Not used by ```each``` above
2 | method call ```each``` | inner array ```arr``` | none | inner array ```arr``` | Yes, as return of block
2-6 | block execution | inner array's integer elements ```num``` | none | ```nil``` | Not used by ```each``` above
3 | comparison operation ```> 5``` | ```num``` | none | ```true``` | Yes, by ```if``` statement
3-5 | ```if``` conditional | comparison operation ```num > 5``` | none | ```nil``` | Yes, by block as ```if``` is last and only statement in block
4 | method call ```puts``` | ```num``` | none | ```nil``` | Yes, by ```if```
