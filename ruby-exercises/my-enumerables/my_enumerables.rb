module Enumerable

  def my_each
    if self.is_a?(Array)
      self.length.times { |i| yield(self[i]) }
    elsif self.is_a?(Hash)
      self.length.times { |i| yield(self.keys[i], self.values[i]) }
    end

    self
  end

  def my_each_with_index
    self.length.times { |i| yield(self[i], i) }
  end

  def my_select
    if self.is_a?(Array)
      results = []
      self.length.times { |i| results << self[i] if yield(self[i]) }
    elsif self.is_a?(Hash)
      results = {}
      self.my_each { |k, v| results[k] = v if yield(k, v) }
    end
    
    results
  end
    
  def my_any?
    result = false
    if self.is_a?(Array)
      self.my_each { |item| result = true if yield(item) }
    elsif self.is_a?(Hash)
      self.my_each { |k, v| result = true if yield(k, v) }
    end

    result
  end

  def my_all?
    result = true
    if self.is_a?(Array)
      self.my_each { |item| result = false unless yield(item) }
    elsif self.is_a?(Hash)
      self.my_each { |k, v| result = false unless yield(k, v) }
    end

    result
  end

  def my_none?
    if self.is_a?(Array)
      result = !self.my_any? { |item| yield(item) }
    elsif self.is_a?(Hash)
      result = !self.my_any? { |k, v| yield(k, v) }
    end

    result
  end

  def my_count(obj=nil)
    result = 0
    self.my_each { |item| result += 1 if item == obj || obj.nil? }
    result
  end

  def my_map(&prc)
    result = []
    if self.is_a?(Array)
      self.my_each { |item| prc.nil? ? result << yield(item) : result << prc.call(item) }
    elsif self.is_a?(Hash)
      self.my_each { |k, v| prc.nil? ? result << yield(k, v) : result << prc.call(k, v) } 
    end
    result
  end

  def my_inject(initial_value = nil)
    initial_value = self[0] if initial_value.nil?
    result = initial_value
    self.my_each { |item| result = yield(result, item) }
    result
  end

  def multiply_els(numbers)
    numbers.my_inject(1) { |total, item| total * item }
  end

end
