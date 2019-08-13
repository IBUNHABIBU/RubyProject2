module Enumerable
  def my_each
    count = 0
    while count < self.size
      yield(self[count])
      count += 1
    end
  end

  def my_each_with_index
    self.size.times{|index| yield(self[index], index)}
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
    self.my_each{|el|
      if yield(el)
        result = false
      else
        result = true
      end
     }
  end
  
  def my_any?
    self.my_each{|el|
       if yield(el)
        return true
       else
        return false 
       end
      }
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
      result
     end
end


def my_inject(initial = nil)
   if initial == nil
    accumulator = self.first
   else 
    accumulator = initial
   end 

   self.my_each{|el|
    accumulator = yield(accumulator, element)
  }
  return accumulator
end

  def multiply_els(arr)
    return arr.my_inject(1){|total,num| total*num }
  end
end

my_proc = Proc.new{|str| str.upcase}
a = [1,2,3].my_map(&my_proc)
puts a
