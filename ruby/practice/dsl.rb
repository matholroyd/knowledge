class Object
  class << self
    private
  
    def my_accessor(field)
      define_method(field) do
        instance_variable_get "@#{field}"
      end
    
      define_method("#{field}=") do |value|
        instance_variable_set "@#{field}", value
      end
    end
    
  end
end

class Something
  my_accessor :something
end

a = Something.new
a.something = "A"


b = Something.new
b.something = "B"

puts a.something
puts b.something


class Class
  private 
  
  def my_accessor2(field)
    define_method(field) do
      instance_variable_get "@#{field}"
    end
  
    define_method("#{field}=") do |value|
      instance_variable_set "@#{field}", value
    end
  end
end

class Something2
  my_accessor2 :something_else
end

c = Something2.new
c.something_else = "C"
puts c.something_else
