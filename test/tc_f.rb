$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "command/command_abstract"
require "command/f"
require "image"
require "test/unit"

class TestF < Test::Unit::TestCase
  def setup
    @image_mock = Image.new(4,4)
  end

  def test_two_points_with_the_same_color_before
    image_before = @image_mock
    image_before.set_pixel(2,2,'B')
    image_before.set_pixel(3,4,'B')

    image_after = @image_mock
    image_after = [['O','B','B','B'],
                   ['O','B','B','B'],
                   ['O','O','B','B'],
                   ['O','O','O','O']]
 
    c = F.new('F',3,1,'B',image_before)
    assert_equal(image_after,c.image.image_array)
  end

  def test_two_points_with_different_color_before
    image_before = @image_mock
    image_before.set_pixel(2,2,'B')
    image_before.set_pixel(3,4,'C')

    image_after = @image_mock
    image_after = [['O','B','B','O'],
                   ['O','B','B','O'],
                   ['O','O','O','C'],
                   ['O','O','O','O']]
 
    c = F.new('F',3,1,'B',image_before)
    assert_equal(image_after,c.image.image_array)
  end

  def test_no_points_before
    image_before = @image_mock

    image_after = @image_mock
    image_after.set_pixel(3,4,'B')
 
    c = F.new('F',4,3,'B',image_before)
    assert_equal(image_after.image_array,c.image.image_array)
  end

  def test_validation_messages
    assert_equal "Let's create image before\n", capture_stdout{CommandFactory.new(["C",3,4,"K"])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["C",6,6,@image_mock])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["C",'fdhf',@image_mock])}.string
  end
end