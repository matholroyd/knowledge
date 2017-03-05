class QueueWithStacks
  def initialize
    @stack = []
    @stack_reverse = []
  end
  
  def push(x)
    while @stack_reverse.length > 0
      @stack.push(@stack_reverse.pop)
    end
    
    @stack_reverse.push(x)
  end
  
  def pop
    while @stack.length > 1
      @stack_reverse.push(@stack.pop)
    end
    
    if @stack.length > 0
      @stack.pop
    else
      @stack_reverse.pop
    end
  end
end