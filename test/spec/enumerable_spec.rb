require_relative "../../enumerable"
# Testing for our own enumerable implementation
RSpec.describe Enumerable do
  numbers = [1, 2, 3, 4, 5]
  disney = {:name => "Mickey", :type => "mouse", "girlfriend" => "Minnie mouse"}
  animals = ["cow","eagle","hyenna"]
  describe "#my_select" do
    it "returns even numbers" do
      expect(numbers.my_select { |value| value % 2 == 0}).to eql([2,4])
    end

    it "returns keys which are string" do
      expect(disney.my_select {|key,value| key.is_a? String }).to eql({"girlfriend" => "Minnie mouse"})
    end
  end

  describe "#my_all?" do
    it "returns false if not all numbers are even" do
      expect(numbers.my_all? {|num| num % 2 == 0}).to eql(false)
    end

    it "returns true if all keys of a hash is of class Symbol" do
      expect(disney.my_all? {|key, value| key.is_a? Symbol}).to eql(false)
    end
  end

  describe "#my_inject" do
    it "adds numeric elements in an array of numbers" do
      expect(numbers.my_inject {|sum, num| sum + num}).to eql(15)
    end

    it "returns the animal with the longest number of characters" do
      expect(disney.my_inject {|left,right| left.values[0].length > right.values[0].length ? left.values[0] : right.values[0]}).to eql("Minnie mouse")
    end
  end

end