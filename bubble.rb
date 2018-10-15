def bubble(numbers)
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