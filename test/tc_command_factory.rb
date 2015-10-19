$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "command_factory"
Dir["./lib/command/*.rb"].each {|file| require file }
require "image"
require "io"
require "test/unit"
require "util_capture"

class TestCommandFactory < Test::Unit::TestCase
  def setup
    @image_mock = Image.new(10,10)
  end

  def test_create_all_command
    assert_instance_of( I, CommandFactory.new(["I",12,12]).obj)
    assert_instance_of( C, CommandFactory.new(["C",@image_mock]).obj)
    assert_instance_of( F, CommandFactory.new(["F",10,10,"T",@image_mock]).obj)
    assert_instance_of( H, CommandFactory.new(["H",2,7,8,"T",@image_mock]).obj)
    assert_instance_of( V, CommandFactory.new(["V",2,7,8,"T",@image_mock]).obj)
    assert_instance_of( L, CommandFactory.new(["L",5,5,"T",@image_mock]).obj)
    assert_instance_of( S, CommandFactory.new(["S",@image_mock]).obj)
  end

  def test_command_fault_command_name
    commands = %w( x cd CCD U JK K)
    commands.each do |command|
      assert_equal(nil, CommandFactory.new([command,@image_mock]).obj )
      out = capture_stdout{CommandFactory.new([command,@image_mock])}
      assert_equal "Wrong command. Type Help for list of command\n", out.string
    end
  end

  def test_command_T_exit
    out = capture_stdout{CommandFactory.new("T")}
    assert_equal "Exit\n", out.string
  end
end