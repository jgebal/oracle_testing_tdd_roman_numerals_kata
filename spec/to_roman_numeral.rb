require_relative 'spec_helper'

commands = File.read( File.dirname(__FILE__) + '/../sources/to_roman_numeral.sql' )

command_list = commands.split(/(CREATE.*?)\/$/m)

command_list.each do |command|
  plsql.execute( command ) if command.gsub(/^$\n/, '').size > 0
end
