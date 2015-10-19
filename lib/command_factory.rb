class CommandFactory
  attr_accessor :obj
  def initialize attributes
    @obj = nil
    if attributes[0] == 'T'
      puts "Exit"
    elsif %w(C F H I L S V Help).include? attributes[0]
      cls = Object.const_get(attributes[0])
      @obj = cls.new(*attributes) if cls.validate(*attributes)
    else
      puts "Wrong command. Type Help for list of command"
    end
  end
end