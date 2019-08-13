module Enumerable
  def my_each
    count = 0
    while count < self.size
      yield(self[count])
      count += 1
    end
  end

  def my_each_with_index
    for element in self
      yield(self.index[element], element)
    end
  end

  def my_select
    result= []
    self.my_each  do |element|
      if yield(element)
        result << element
      end
    end 
    result 
  end

  def my_all?
    self.my_each { |elem| return false if yield(elem) == false}
    true
    end
  end

  def my_none?
    self.my_any? {|elem| yield(elem)} == false ? true : false
  end

 
  def my_count
    return self.size unless block.given?
    num = 0
    num.my_each do |element|
      if yield(element)
        num += 1
      end
    end
      nums
   end
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
end

def my_inject(init=0)
  result = self[init]
  self[init..-1].size.times do |index| 
    result = yield(result, self[index + 1]) if self[index + 1]
    end
  result
  end 
end

def multiply_els(arr)
  arr.my_inject
  arr
end

my_proc = Proc.new{|num| num*2}
a = [1,2,3].my_each(&my_proc)
puts a
