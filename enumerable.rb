module Enumerable
# my_each
  def my_each
    for i in 0...self.size
      self.class == Hash ? yield(self.keys[i], self.values[i],i) : yield(self[i],i)
    end
  end

#   my_select
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
  def my_any?
    for i in 0...self.size
      return true if (self.class == Array && yield(self[i],i)) || (self.class == Hash && yield(self.keys[i],self.values[i]))
      # self.class == Array && !yield(self[i],i) || self.class == Hash && !yield(self.keys[i],self.values[i])
    end
    false
  end
  def my_none?
    for i in 0...self.size
      return true if (self.class == Array && !yield(self[i],i)) || (self.class == Hash && !yield(self.keys[i],self.values[i]))
      # self.class == Array && !yield(self[i],i) || self.class == Hash && !yield(self.keys[i],self.values[i])
    end
    false
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
puts a.my_none? {|k,v| k == :banana}
puts b.my_none? {|v,i| v < 0}