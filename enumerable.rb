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
    for i in 1...self.size
        output.push(self[i]) if self.class == Array && yield(self[i],i)
        output[self.keys[i]] = self.values[i] if self.class == Hash && yield(self.keys[i],self.values[i])
      end
      output
  end

end

a = {
  :apple => "hello",
  :orange => "hi"
}
b = [5,4,7,9,8,6]

# a.my_each {|key , value| puts "#{key} : #{value}"}
# b.my_each {|value| puts "#{value}"}
puts a.my_select {|k,v| k == :apple}
p b.my_select {|x| x % 2 == 0}