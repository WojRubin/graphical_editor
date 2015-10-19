class H < CommandAbstract
  def initialize *attributes
    @image = attributes.last
    
    col_from = x1 = attributes[1].to_i
    col_to = x2 = attributes[2].to_i
    m = y = attributes[3].to_i
    color = c = attributes[4]

    for n in (col_from..col_to)
      @image.set_pixel(m,n,color)
    end
  end

  def self.validate *attributes
    image = attributes[5] if attributes[5].class == Image
    @error_message = nil
    @error_message = "X1 should be in range between 1 and number of pixels" unless image && attributes[1].to_i.between?(1,image.n_length)
    @error_message = "X2 should be in range between 1 and number of pixels" unless image && attributes[2].to_i.between?(1,image.n_length)
    @error_message = "Y should be in range between 1 and number of pixels" unless image && attributes[3].to_i.between?(1,image.m_length)
    @error_message = "Color should be a uppercase letter from A to Z" unless attributes[4] =~ /^[A-Z]{1}$/
    @error_message = "Wrong number of attributes" unless attributes.length == 6
    @error_message = "Let's create image before" unless attributes.last.class == Image
    super()
  end
end