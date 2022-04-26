class MaxIntSet
  attr :store
  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num >= @store.size
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return if self.include?(num)
    self[num] << num
  end

  def remove(num)
    self[num] = self[num] - [num]
  end

  def include?(num)
    self[num].include? num
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def []=(num,val)
    @store[num % num_buckets] = val
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if self.include?(num)
    resize! if count >= num_buckets
    self[num] << num
  end

  def remove(num)
    self[num] = self[num] - [num]
  end

  def include?(num)
    self[num].include? num
  end

  def count
    @store.map{|b|b.count}.sum
  end
  private

  def [](num)
    @store[num % num_buckets]
  end

  def []=(num,val)
    @store[num % num_buckets] = val
  end

  def num_buckets
    @store.length
  end

  def resize!
    current = @store
    @store = Array.new(num_buckets*2) { Array.new }
    current.each{|b|b.each{|e|insert(e)}}
  end
end
