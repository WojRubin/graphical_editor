class Editor
  attr_accessor :image

  def doing
    begin
      io = Io.new
      arr_data = []
      until arr_data[0] == 'T'
        data = io.input
        arr_data = data.split(" ")
        arr_data.push(@image) unless @image.nil?
        obj = CommandFactory.new(arr_data).obj
        @image = obj.image if obj
      end
    rescue
      puts "wrong data"
      Editor.new.doing
    end
  end
end
