module Enumerable
  def my_each_with_index
    for i in 0...self.length
      yield(self[i], i)
    end

    self
  end

  def my_select
    result = []
    my_each { |elm| result << elm if yield(elm) }
    result
  end

  def my_all?
    my_each { |elm| return false unless yield(elm) }
    true
  end

  def my_any?
    my_each { |elm| return true if yield(elm) }
    false
  end

  def my_none?
    my_each { |elm| return false if yield(elm) }
    true
  end

  def my_count
    return self.length unless block_given?

    count = 0
    my_each { |elm| count += 1 if yield(elm) }
    count
  end

  def my_map
    result = []
    my_each { |elm| result << yield(elm) }
    result
  end

  def my_inject(initial_value)
    result = initial_value
    my_each { |elm| result = yield(result, elm) }
    result
  end
end

class Array
  def my_each
    for elm in self do
      yield(elm)
    end

    self
  end
end
