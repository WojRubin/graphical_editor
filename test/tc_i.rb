$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "command/command_abstract"
require "command/i"
require "image"
require "test/unit"

class TestH< Test::Unit::TestCase
  def setup
    @image_mock = Image.new(7,3)
  end

  def test_initialize
    i = I.new('I',3,7)
    assert_equal(@image_mock.image_array,i.image.image_array)
  end

  def test_validation_messages
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["I",8,12,3,"K"])}.string
    assert_equal "An image has been created before\n", capture_stdout{CommandFactory.new(["I",2,5,@image_mock])}.string
    assert_equal "X Y should be number above 0\n", capture_stdout{CommandFactory.new(["I",-2,4])}.string
  end
end