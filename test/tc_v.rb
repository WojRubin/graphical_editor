$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "command/command_abstract"
require "command/v"
require "image"
require "test/unit"

class TestC< Test::Unit::TestCase
  def setup
    @image_mock = Image.new(4,4)
  end

  def test_initialize
    image_before = @image_mock

    image_after = @image_mock
    image_after = [['O','O','O','O'],
                   ['O','B','O','O'],
                   ['O','B','O','O'],
                   ['O','O','O','O']]
 
    v = V.new('V',2,2,3,'B',@image_mock)
    assert_equal(image_after,v.image.image_array)
  end

  def test_validation_messages
    assert_equal "X should be in range between 1 and number of pixels\n", capture_stdout{CommandFactory.new(["V",20,2,3,"K",@image_mock])}.string
    assert_equal "Y1 should be in range between 1 and number of pixels\n", capture_stdout{CommandFactory.new(["V",2,5,3,"K",@image_mock])}.string
    assert_equal "Y2 should be in range between 1 and number of pixels\n", capture_stdout{CommandFactory.new(["V",2,4,5,"K",@image_mock])}.string
    assert_equal "Let's create image before\n", capture_stdout{CommandFactory.new(["V",2,3,4,"T"])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["V",2,2,@image_mock])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["V",4,2,1,2,2,@image_mock])}.string
  end
end