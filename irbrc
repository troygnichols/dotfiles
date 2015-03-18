require 'rubygems'

begin
  require 'interactive_editor'
rescue LoadError
  warn 'Could not find interactive_editor, run "gem install interactive_editor" to ' +
    'use an external editor with irb'
end
