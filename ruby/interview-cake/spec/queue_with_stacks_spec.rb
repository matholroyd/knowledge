require 'rspec'
require_relative '../lib/queue_with_stacks'

describe QueueWithStacks do
  let(:queue) { QueueWithStacks.new }
  
  it "should output FIFO simple example" do
    queue.push(1)
    queue.push(2)

    expect(queue.pop).to eq(1)
    expect(queue.pop).to eq(2)
  end
  
  it "should output FIFO complex example" do
    queue.push(1)
    queue.push(2)
    expect(queue.pop).to eq(1)
    
    queue.push(3)
    expect(queue.pop).to eq(2)
    expect(queue.pop).to eq(3)
  end
end
