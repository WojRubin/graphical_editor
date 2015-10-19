class C < CommandAbstract

  def initialize *attributes
    @image = attributes.last
    @image.set_all_pixels('O')
  end

  def self.validate *attributes
    @error_message = nil
    @error_message = "Wrong number of attributes" unless attributes.length == 2
    @error_message = "Let's create image before" unless attributes.last.class == Image
    super()
  end
end