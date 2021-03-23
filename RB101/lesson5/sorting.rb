def properly_sorted?(array)
  count = 0
  sorted_checks = []
  
  loop do
    sorted_checks << true if array[count] < array[count + 1]
    sorted_checks << false if array[count] > array[count + 1]
    
    count += 1
    break if count == array.length - 1
  end  

  sorted_checks.all?
end  

def be_sorted(array)
  loop do
    count = 0
    
    loop do
      if array[count] > array[count + 1]
        val1 = array[count]
        val2 = array[count + 1]
        
        array[count] = val2
        array[count + 1] = val1
      end  
      
      count += 1
      break if count == array.length - 1
    end  
    
    break if properly_sorted?(array)
  end  
  
  array
end  

p be_sorted([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
p be_sorted([16, 2, 6, 4, 5]) == [2, 4, 5, 6, 16]
p be_sorted([1, 8, 3, 35, 5]) == [1, 3, 5, 8, 35]
p be_sorted(['a', 'b', 'c', 'd']) == ['a', 'b', 'c', 'd']
p be_sorted(['b', 'a', 'c', 'd']) == ['a', 'b', 'c', 'd']
p be_sorted(['d', 'a', 'c', 'b' ]) == ['a', 'b', 'c', 'd']
