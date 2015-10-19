class F < CommandAbstract
  def initialize *attributes
    @image = attributes.last
    
    x = attributes[1].to_i - 1
    y = attributes[2].to_i - 1
    color = c = attributes[3]

    pixel_arr = @image.find_pixels(color)

    if pixel_arr.any?
      pixel_arr.each do |position|
        m = position[0]
        n = position[1]
        if x <= n
          col_from = x
          col_to = n
        else
          col_from = n
          col_to = x
        end
        if y <= m
          row_from = y
          row_to = m
        else
          row_from = m
          row_to = y
        end

        @image.image_array.each_with_index do |value,m|
          value.each_with_index do |value,n|
            if m.between?(row_from,row_to) && n.between?(col_from,col_to)
              @image.image_array[m][n] = color
            end
          end
        end
      end
    else
      @image.set_pixel(attributes[2].to_i,attributes[1].to_i,color)
    end
  end

  def self.validate *attributes
    image = attributes.last
    @error_message = nil
    @error_message = "X Y should be number above 0" unless attributes[1].to_i.between?(1,image.n_length) && attributes[2].to_i.between?(1,image.m_length)
    @error_message = "Color should be a uppercase letter from A to Z" unless attributes[3] =~ /^[A-Z]{1}$/
    @error_message = "Wrong number of attributes" unless attributes.length == 5
    @error_message = "Let's create image before" unless attributes.last.class == Image
    super()
  end
end