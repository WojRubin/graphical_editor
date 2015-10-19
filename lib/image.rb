class Image
  attr_accessor :image_array
  
  def initialize m,n
    @m = m; @n = n
    @image_array = Array.new
    for mm in (0..@m-1)
      @image_array[mm] = Array.new
      for mn in (0..@n-1)
        @image_array[mm][mn] = "O"
      end
    end
  end

  def clear
    self.set_all_pixels("O")
  end

  def set_all_pixels(color)
    @image_array.each_with_index do |value,m|
      value.each_with_index do |value,n|
        self.set_pixel(m,n,color)
      end
    end
  end

  def set_pixel(m,n,color)
    @image_array[m-1][n-1] = color
  end

  def m_length
    @image_array.length
  end

  def n_length
    @image_array[0].length
  end

  def find_pixels color
    arr = []
    @image_array.each_with_index do |value,m|
      value.each_with_index do |value,n|
        arr << [m,n] if @image_array[m][n] == color
      end
    end
    arr
  end
end