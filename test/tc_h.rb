$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "command/command_abstract"
require "command/h"
require "image"
require "test/unit"

class TestH< Test::Unit::TestCase
  def setup
    @image_mock = Image.new(4,4)
  end

  def test_initialize
    image_before = @image_mock

    image_after = @image_mock
    image_after = [['O','O','O','O'],
                   ['O','B','B','O'],
                   ['O','O','O','O'],
                   ['O','O','O','O']]
 
    h = H.new('H',2,3,2,'B',@image_mock)
    assert_equal(image_after,h.image.image_array)
  end

  def test_validation_messages
    assert_equal "X1 should be in range between 1 and number of pixels\n", capture_stdout{CommandFactory.new(["H",20,2,3,"K",@image_mock])}.string
    assert_equal "X2 should be in range between 1 and number of pixels\n", capture_stdout{CommandFactory.new(["H",2,5,3,"K",@image_mock])}.string
    assert_equal "Y should be in range between 1 and number of pixels\n", capture_stdout{CommandFactory.new(["H",2,4,5,"K",@image_mock])}.string
    assert_equal "Let's create image before\n", capture_stdout{CommandFactory.new(["H",2,3,4,"T"])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["H",2,2,@image_mock])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["H",4,2,1,2,2,@image_mock])}.string
  end
end