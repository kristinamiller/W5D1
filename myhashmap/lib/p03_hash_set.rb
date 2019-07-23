# class HashSet
#   attr_reader :count

#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(key)
#   end

#   def include?(key)
#   end

#   def remove(key)
#   end

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end

#   def num_buckets
#     @store.length
#   end

#   def resize!
#   end
# end

class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    
  end

  def insert(key)
    resize! if @count == num_buckets
    bucket = key.hash % num_buckets
    if !include?(key)
      @store[bucket] << key
      @count += 1
    end
  end

  def remove(key)
    bucket = key.hash % num_buckets
    if include?(key)
      @store[bucket].delete(key)
      @count -= 1
    end
  end

  def include?(key)
    bucket = key.hash % num_buckets
    @store[bucket].include?(key)
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
