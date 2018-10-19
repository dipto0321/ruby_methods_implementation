require_relative "../../enumerable"
# Testing for our own enumerable implementation
RSpec.describe Enumerable do
  numbers = [1,2,3,4,5]
  disney = {:name => "Mickey", :type => "mouse"}
  describe "#my_select" do
    it "return even numbers" do
      expect(numbers.my_select { |value| value % 2 == 0}).to eql([2,4])
    end
  end
  describe "#my_all?" do
    it "returns false if not all numbers are even" do
      expect(numbers.my_all? {|num| num % 2 == 0}).to eql(false)
    end

    it "returns true if all keys of a hash is of class Symbol" do
      expect(disney.my_all? {|key, value| key.is_a? Symbol}).to eql(true)
    end
  end
end