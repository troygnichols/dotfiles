require 'rubygems'

begin
  require 'interactive_editor'
rescue LoadError
  warn 'Could not find interactive_editor, run `gem install interactive_editor` to ' +
    'use an external editor with irb'
end

begin
  require 'bond'
  require 'pry-bond'
rescue LoadError
  warn 'Could not find pry-bond, run `gem install bond pry-bond` to ' +
    'get improved completions'
end

if defined?(ActiveRecord)
  class ActiveRecord::Base
    def self.sample
      self.offset(rand(self.count)).first
    end
  end

  class ActiveRecord::Relation
    def sample
      self.offset(rand(self.count)).first
    end
  end

  def toggle_logger
    @_old_logger, ActiveRecord::Base.logger = ActiveRecord::Base.logger, @_old_logger
    @_old_logger ? 'Logging Off' : 'Logging On'
  end
end

def qbm
  s = Time.now.to_f
  ret = yield
  puts "#{(Time.now.to_f - s).round(3)}s"
  ret
end

# vim: syntax=ruby
