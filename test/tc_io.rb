$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "command/command_abstract"
require "io"
require "image"
require "test/unit"

class TestL< Test::Unit::TestCase
  def setup
    @image_mock = Image.new(4,4)
  end

  def test_puts_matrix
    @image_mock.image_array = [['O','O','O','O'],
                               ['O','B','O','O'],
                               ['O','B','O','O'],
                               ['O','O','O','O']]
 
    assert_equal "=>\nOOOO\nOBOO\nOBOO\nOOOO\n", capture_stdout{Io.new.puts_image(@image_mock)}.string
  end
end



