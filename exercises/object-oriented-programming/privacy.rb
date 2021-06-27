class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def print_state
    puts "State: #{switch}"
  end

  private
  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

bot = Machine.new

bot.start
bot.print_state

bot.stop
bot.print_state

bot.flip_switch(:test)
