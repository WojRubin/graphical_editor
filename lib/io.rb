class Io
  def input
    print '>'
    data = gets
  end

  def puts_image image
    puts '=>'
    image.image_array.each do |m|
      line = ''
      m.each do |n|
        line << n.to_s
      end
      puts line
    end
  end
end