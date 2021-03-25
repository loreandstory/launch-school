```
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

## Output

```
=> [[2, 4], [6,8]]
```

## Breakdown

Line | Action | Object | Side Effects | Returns | Return Value Used?
---| --- | --- | --- | --- | ---
1 | method call ```map``` | multidimensional array ```[[1, 2], [3, 4]]``` | none | new transformed array with all values multiplied by 2: ```[[2, 4], [6, 8]]```| No
1-5 | outer block execution | each sub array ```arr``` | none | new transformed sub array with all values multiplied | Yes, by outer ```map```
2 | method call ```map``` | each sub array ```arr``` | none | new transformed sub array with its inner values multiplied by 2 | Yes, by outer block
2-4 | inner block execution | each value ```num``` held in sub array ```arr``` | none | each value ```num``` held in sub array ```arr``` multiplied by 2 | Yes, by inner ```map```
3 | multiplication ```* 2``` | each value ```num``` held in sub array ```arr``` | none | each value ```num``` held in sub array ```arr``` multiplied by 2 | Yes, used by block as its own return value