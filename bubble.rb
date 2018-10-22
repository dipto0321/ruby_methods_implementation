# Dipto's Solution
=begin

 NOTE: 
 [Bubble Sort Algorithm]
 ==========================
 begin BubbleSort(list)

   for all elements of list
      if list[i] > list[i+1]
         swap(list[i], list[i+1])
      end if
   end for
   
   return list
   
end BubbleSort
============================
=end

def bubble_sort(numbers)
  i,j,len = 0, 0, numbers.length
  while i<len do
    j=0
    while j < len-i-1 do
      numbers[j] , numbers[j+1] = numbers[j+1] , numbers[j] if numbers[j] > numbers[j+1]
      j += 1
    end
    i+=1
  end
 return numbers
end

def bubble_sort_by(numbers)
  i,j,len = 0, 0, numbers.length
  while i<len do
    j=0
    while j < len-i-1 do
      numbers[j] , numbers[j+1] = numbers[j+1] , numbers[j] if yield(numbers[j],numbers[j+1]) > 0
      j += 1
    end
    i+=1
  end
 return numbers
end

p bubble_sort_by(["hi", "hey", "hello"]) {|left, right| left.length - right.length}
animals = %w[dog eagle zebra tiger cat]
p bubble_sort_by(animals) {|left, right| left.length - right.length}
