$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "command/command_abstract"
require "command/c"
require "image"
require "test/unit"

class TestC < Test::Unit::TestCase
  def setup
    @image_mock = Image.new(10,10)
  end

  def test_initialize
    image_before = @image_mock
    image_before.set_all_pixels("B")

    image_after = @image_mock
    image_after.set_all_pixels("O")
 
    c = C.new(image_before)
    assert_equal(image_after.image_array,c.image.image_array)
  end

  def test_validation_messages
    assert_equal "Let's create image before\n", capture_stdout{CommandFactory.new("C")}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["C",6,6,@image_mock])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["C",'fdhf',@image_mock])}.string
  end
end