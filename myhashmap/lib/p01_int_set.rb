class MaxIntSet
    attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
    num <= @max && num >= 0
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets 
  end

  def insert(num)
    bucket = num % @num_buckets
    @store[bucket] << num
  end

  def remove(num)
    bucket = num % @num_buckets
    @store[bucket].delete(num)
  end

  def include?(num)
    bucket = num % @num_buckets
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
    resize! if @count == num_buckets
    bucket = num % num_buckets
    if !include?(num)
      @store[bucket] << num
      @count += 1
    end
  end

  def remove(num)
    bucket = num % num_buckets
    if include?(num)
      @store[bucket].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = num % num_buckets
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      @count = 0
      old_store = @store.dup
      @store = Array.new(2 * num_buckets) {[]}
      old_store.each do |bucket|
        bucket.each do |el|
          insert(el)
        end
      end
    
  end
end
