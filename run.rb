$:.unshift File.join(File.dirname(__FILE__), "lib")
require 'command/command_abstract'
require 'command_factory'
require 'io'
require 'image'
Dir[File.dirname(__FILE__) + '/lib/command/*.rb'].each {|file| require file }
require 'editor'


e = Editor.new
e.doing
