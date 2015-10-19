$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "image"
require "test/unit"

class TestImage < Test::Unit::TestCase

  def test_get_3_3_image
    arr = [['O','O','O'],
           ['O','O','O'],
           ['O','O','O']]
    assert_equal(arr, Image.new(3,3).image_array )
  end
  def test_get_0_0_image
    arr = []
    assert_equal(arr, Image.new(0,0).image_array )
  end
  def test_set_image
    arr = [[ 'O','o','O'],
           ['o','O','O'],
          ['O','o','O']]
    assert_equal(arr, Image.new(3,3).image_array = arr )
  end
  def test_clear_image
    arr_before = [['O','o','O'],
                    ['O','O','O'],
                  [nil,'o',nil]]
    arr_after = [['O','O','O'],
                 ['O','O','O'],
                 ['O','O','O']]

    image = Image.new(3,3)
    image.image_array = arr_before
    assert_equal(arr_after, image.clear )
  end

  def test_set_pixel
    arr_after = [['O','O','O'],
                 ['O','A','O'],
                 ['O','O','O']]

    image = Image.new(3,3)
    image.set_pixel(2,2,'A')
    assert_equal(arr_after, image.image_array )
  end

  def test_set_all_pixel
    arr_after = [['A','A','A'],
                 ['A','A','A'],
                 ['A','A','A']]

    image = Image.new(3,3)
    image.set_all_pixels('A')
    assert_equal(arr_after, image.image_array )
  end

  def test_m_length
    assert_equal(3, Image.new(3,3).m_length )
  end

  def test_n_length
    assert_equal(2, Image.new(3,2).n_length )
  end

  def test_find_pixels
    arr = [['O','O','O'],
           ['O','K','O'],
          ['O','O','K']]
    image = Image.new(3,3)
    image.image_array = arr
    assert_equal([[1,1],[2,2]], image.find_pixels("K") )
  end
end