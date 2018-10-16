# Putting a bubble_sort method in Array class
load "enumerable.rb"
class Array
    include Enumerable
  def bubble_sort
    iter = 0
    1.upto(self.size) do
        self.my_inject(self) { |acc,nxt,j|
            a, b = acc[j] , acc[j + 1]
            acc[j], acc[j + 1] = b, a if !b.nil? && a > b
            acc
          }
    end
    self
  end

  def bubble_sort_by
    iter = 0
    1.upto(self.size) do
        self.my_inject(self) { |acc,nxt,j|
            a, b = acc[j] , acc[j + 1]
            acc[j], acc[j + 1] = b, a if !b.nil? && yield(a,b) >= 0
            acc[j], acc[j + 1] = a,b if !b.nil? && yield(a,b) < 0
            acc
          }
    end
    self
  end

end

unsorted = [9,6,5,3,2]
print unsorted.bubble_sort
puts "\n\n"
print unsorted.bubble_sort_by {|a,b| b - a}