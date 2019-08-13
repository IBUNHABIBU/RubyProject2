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

  def my_none?
    output = true
      self.my_each { |item| output = false if yield(item)}
      return output
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
 
  def my_count(item = nil)
    count = 0
    if item != nil
      self.my_each{ |element| count += 1 if element == item }
    elsif block_given?
      self.my_each{ |element| count += 1 if yield(element)}
    else
      count = self.length 
    end
    return count
  end
  

  
def my_map(*procs)
    result = []
    if procs.count == 0
        self.my_each{ |x| result << yield(x) }   
    else
      procs = procs[0]
      self.my_each(&proc)
    end
    result
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
end

  def multiply_els(arr)
    return arr.my_inject(1, :*)
  end



my_proc = Proc.new{|str| str.upcase}
a = ["a","b","c"].my_map(&my_proc)
puts a
