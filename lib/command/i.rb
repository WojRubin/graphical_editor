class I < CommandAbstract

  def initialize *attributes
    @image = Image.new(attributes[2].to_i,attributes[1].to_i)
    @image.set_all_pixels('O')
  end

  def self.validate *attributes
    @error_message = nil
    @error_message = "Wrong number of attributes" unless attributes.length == 3
    @error_message = "An image has been created before" if attributes.last.class == Image
    @error_message = "X Y should be number above 0" unless attributes[1].to_i > 0 && attributes[2].to_i > 0
    super()
  end
end