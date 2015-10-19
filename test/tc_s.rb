require "command/command_abstract"
require "command/s"
require "image"
require "test/unit"

class TestS< Test::Unit::TestCase
  def setup
    @image_mock = Image.new(4,4)
  end

  def test_initialize
    @image_mock.image_array = [['O','O','O','O'],
                              ['O','B','O','O'],
                              ['O','B','O','O'],
                              ['O','O','O','O']]
 
    s = S.new('S',@image_mock)
    assert_equal "=>\nOOOO\nOBOO\nOBOO\nOOOO\n", capture_stdout{CommandFactory.new(["S",@image_mock])}.string
  end

  def test_validation_messages

    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["S",'aa',4,@image_mock])}.string
    assert_equal "Wrong number of attributes\n", capture_stdout{CommandFactory.new(["S",4,2,@image_mock])}.string
    assert_equal "Let's create image before\n", capture_stdout{CommandFactory.new(["S"])}.string
  end

end