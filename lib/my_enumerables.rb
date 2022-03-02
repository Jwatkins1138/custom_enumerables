module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield (self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    i = 0
    output_array = Array.new
    while i < self.length
      if yield self[i]
        output_array.push(self[i])
      end
      i += 1
    end
    output_array
  end

  def my_all?
    i = 0
    output = true
    while i < self.length
      if yield self[i]
        output = true
      else
        output = false
        break
      end
      i += 1
    end
    output
  end

  def my_any?
    i = 0
    output = false
    while i < self.length
      if yield self[i]
        output = true
        break
      else
        output = false
      end
      i += 1
    end
    output
  end

  def my_none?
    i = 0
    output = true
    while i < self.length
      if yield self[i]
        output = false
        break
      end
      i += 1
    end
    output
  end

  def my_count
    i = 0
    v = 0
    if block_given?
      while i < self.length
        if yield self[i]
          v += 1
        end
        i += 1
      end
      v
    else
      self.length
    end
  end

  def my_map
    i = 0
    output_array = Array.new
    while i < self.length
      output_array.push(yield self[i])
      i += 1
    end
    output_array
  end

  def my_inject(acc = nil, &block)
    if acc == nil
      i = 0
      acc = self[0]
      while i < (self.length - 1)
        acc = block.call(acc, self[i + 1])
        i += 1
      end
    else
      i = 0
      while i < self.length
        acc = block.call(acc, self[i])
        i += 1
      end 
    end
    acc
  end
end


