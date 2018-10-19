module Enumerable
  #my_each
  def my_each
    for i in 0...self.size
      self.class == Hash ? yield(self.keys[i], self.values[i],i) : yield(self[i],i)
    end
  end

  #my_select
  def my_select
    output = self.class == Array ? [] : {}
    for i in 0...self.size
      output.push(self[i]) if self.class == Array && yield(self[i],i)
      output[self.keys[i]] = self.values[i] if self.class == Hash && yield(self.keys[i],self.values[i])
    end
    output
  end

  #my_all?
  def my_all?
    for i in 0...self.size
      return false if (self.class == Array && !yield(self[i],i)) || (self.class == Hash && !yield(self.keys[i],self.values[i]))
      # self.class == Array && !yield(self[i],i) || self.class == Hash && !yield(self.keys[i],self.values[i])
    end
    true
  end
  #my_any?
  def my_any?
    for i in 0...self.size
      return true if (self.class == Array && yield(self[i],i)) || (self.class == Hash && yield(self.keys[i],self.values[i]))
      # self.class == Array && !yield(self[i],i) || self.class == Hash && !yield(self.keys[i],self.values[i])
    end
    false
  end
  #my_none?
  def my_none?
    for i in 0...self.size
      return true if (self.class == Array && !yield(self[i],i)) || (self.class == Hash && !yield(self.keys[i],self.values[i]))
      # self.class == Array && !yield(self[i],i) || self.class == Hash && !yield(self.keys[i],self.values[i])
    end
    false
  end
  #my_count
  def my_count(arg = nil)
    count = 0
    return self.size if arg.nil? block_given?
    block_given? && arg.nil? ? self.my_each {|el| count += 1 if yield(el)} : self.my_each {|x| count += 1 if x == arg }
    count
  end
  #my_map
  def my_map
    output = []
    self.my_each {|x,y| self.class == Array ? output.push(yield(x)) : output.push(yield(x,y))}
    output
  end
  
  #my_inject
  def my_inject(arg = nil)
    arr = self.class == Array ? self.slice(0..-1) : self.class == Range ? self.to_a : self.my_map {|k, v| {k => v} }
    acc = arg == nil ? arr[0] : arg
    nxt = arg == nil ? arr[1] : arr[0]
    start = arg == nil ? 1 : 0
    for i in start...arr.size
      res = yield(acc,nxt,i,arr)
      acc = res
      nxt = arr[i+1]
    end
    return acc
  end

end

a = {
  :apple => "hello",
  :orange => "hi"
}
b = [5,4,7,9,8,6]

# a.my_each {|key , value| puts "#{key} : #{value}"}
# b.my_each {|value| puts "#{value}"}
# puts a.my_select {|k,v| k == :apple}
# p b.my_select {|x| x % 2 == 0}

# puts a.my_all? {|k,v| k == :apple}
# puts b.my_all? {|v,i| v > 0}
# puts a.my_any? {|k,v| k == :apple}
# puts b.my_any? {|v,i| v > 0}
# puts a.my_none? {|k,v| k == :banana}
# puts b.my_none? {|v,i| v < 0}
# ary = [1, 2, 4, 2]
# puts ary.my_count(2)
# puts ary.my_count{ |x| x % 2 ==0 }

# puts a.my_map {|k,v| "#{v} Dipto and Ryan!"}
# p b.my_map {|n| n*2}
# p b.my_inject {|sum,n| sum+n }

# p (5..10).my_inject { |sum, n| sum + n }

# longest = %w{ cat sheep bear }.my_inject do |memo, word|
#   memo.length > word.length ? memo : word
# end

# # p longest

# def multiply_els(arr)
#   return arr.my_inject {|x,y| x*y}
# end

# p multiply_els([2,4,5])

# product = Proc.new {|n| n * 2}
# sum = Proc.new {|n| n + 2}
# power = Proc.new{|x| x**2}
# cool = Proc.new{|k,v| "#{v} is a cool #{k} language"}
 
# test = [1,2,3,4,5,6]
# languages = {:frontend => "JavaScript" , :backend => "Ruby"}
# p test.my_map(&product).my_map {|i| i**2}
# p test.my_map(&sum)
# p test.my_map(&power)
# puts "\n\n"
# print languages.my_map(&cool)

# p a.my_inject {|left , right| left.values[0] > right.values[0] ? left.keys[0] : right.keys[0] }