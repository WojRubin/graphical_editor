class CommandAbstract
  attr_accessor :image

  def initialize *attributes
    raise NotImplementedError, "You should implement this method"
  end

  def self.validate *attributes
    if @error_message
      puts @error_message
      return false
    else
      return true
    end
  end
end