$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "command/command_abstract"
require "command/l"
require "image"
require "test/unit"

class TestL< Test::Unit::TestCase
  def setup
    @image_mock = Image.new(4,4)
  end

  def test_initialize
    image_after = [['O','O','O','O'],
                   ['O','B','O','O'],
                   ['O','O','O','O'],
                   ['O','O','O','O']]
 
    l = L.new('L',2,2,'B',@image_mock)
    assert_equal(image_after,l.image.image_array)
  end

  def test_validation_messages
    assert_equal "X Y should be a number between 1 and number of pixels\n", capture_stdout{CommandFactory.new(["L",-2,4,"K",@image_mock])}.string
    assert_equal "Color should be a uppercase letter from A to Z\n", capture_stdout{CommandFactory.new(["L",2,3,"TT",@image_mock])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["L",2,2,1,6,"G",@image_mock])}.string
    assert_equal "Let's create image before\n", capture_stdout{CommandFactory.new(["L",4,2,"H"])}.string
  end
end