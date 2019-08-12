module Enumerable
  def my_each
    count = 0
    while count < self.size
      yield(self[count])
      count += 1
    end

  def my_each_width_index
    index = 0
    for element in self
      yield(self[element], element)
      index += 1
  end

  def my_select
    result= []
    self.my_each{|element|
      if yield(element)
        result << element
      end
    }  
  end

  def my_all?
    result = false
    self.my_each{|element| yield(element) ? result = true : result= false}
    result
  end

  def my_any?
    result = false
    self.my_each{|element| result = true if yield(element)}
  end

  def my_none?
    result = true
    self.my_each{|element| result = false if  yield (element)}
  end

  def count
    num = 0
    num.my_each do |element|
      if yield(element)
        num += 1
      end
      nums
    end
  
  def my_map(*procs)
    result = []
    if procs.count == 0
      self.my_each do |x|
        result << yield(x)
    else
      procs = procs[0]
      self.my_each(&proc)
    end
  end

  def my_inject(*start_num)
    result = 0
    if start_num.count == 0
      self.my_each do |el|
        result = yield(result, el)
      return result
      end
    else
      start_num = start_num[0]
      self.my_each do |x|
        start_num = yield (start_num, x)
      return start_num
      end
    end
  end   
end

def multiply_els(arr)
  result = 1
  for i in arr
    result *= 1
  end
  result
end

my_proc = Proc.new{|num| num*2}
a = [1,2,3].my_each(&my_proc)
puts a
