# -*- mode: ruby -*-

require 'rubygems'

puts 'Loading global .irbrc'

begin
  require 'interactive_editor'
rescue LoadError
  warn 'Could not find interactive_editor, run `gem install interactive_editor` to ' +
    'use an external editor with irb'
end

begin
  require 'bond'
  Bond.start
rescue LoadError
  warn 'Could not find bond, run `gem install bond` to ' +
    'get improved completions'
end

begin
  require 'irbtools'
  require 'irbtools/more'
rescue LoadError
  warn 'Could not find irbtools, run `gem install irbtools irbtools-more` to ' +
    'get various helpers'
end

begin
  require 'awesome_print'
rescue LoadError
  warn 'Could not find awesome_print, run `gem install awesome_print` to ' +
    'get the `ap` method'
end

# if there is a different .irbrc file in the current directory, load it
if Dir.pwd != ENV['HOME'] && File.exist?('.irbrc')
  puts 'Loading local .irbrc'
  load '.irbrc'
end
