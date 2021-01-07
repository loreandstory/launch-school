def execute(&block)
  block.call
end

p execute { puts "Executed from Block!" }