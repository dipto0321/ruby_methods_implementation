# Putting a bubble_sort method in Array class
class Array
  def bubble_sort
    sorted = []
    1.upto(self.size) do
      last_el = self.reduce { |x, y| x > y ? x : y }
      break if last_el.nil?

      sorted.unshift(last_el)
      self.delete(last_el)
    end
    self.clear.concat(sorted)
  end
end
