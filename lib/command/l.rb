class L < CommandAbstract

  def initialize *attributes
    @image = attributes.last
    @image.set_pixel(attributes[2].to_i,attributes[1].to_i,attributes[3])
  end

  def self.validate *attributes
    image = attributes[4] if attributes[4].class == Image
    @error_message = nil
    @error_message = "X Y should be a number between 1 and number of pixels" unless  image && attributes[1].to_i.between?(1,image.n_length) && attributes[2].to_i.between?(1,image.m_length)
    @error_message = "Color should be a uppercase letter from A to Z" unless attributes[3] =~ /^[A-Z]{1}$/
    @error_message = "Wrong number of attributes" unless attributes.length == 5
    @error_message = "Let's create image before" unless attributes.last.class == Image
    super()
  end
end