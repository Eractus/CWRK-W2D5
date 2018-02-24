class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if validate!(num)
      @store[num] = true
    end
  end

  def remove(num)
    if @store[num] == true
      @store[num] = false
    end
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    if num < 0 || num > @max
      false
      raise "Out of bounds"
    elsif @store[num] == true
      false
    else
      true
    end
  end

  def validate!(num)
    return true if is_valid?(num)
    false
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
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
    unless self[num].include?(num)
      self[num] << num
      @count += 1
      if @count > num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_length = num_buckets * 2
    new_store = Array.new(new_length) { Array.new }
    @store.flatten.each { |num| new_store[num % new_length] << num }
    @store = new_store
  end
end
