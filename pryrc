require 'rubygems'

begin
  require 'interactive_editor'
rescue LoadError
  warn 'Could not find interactive_editor, run "gem install interactive_editor" to ' +
    'use an external editor with irb'
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

  def tail_app_events
    toggle_logger if ActiveRecord::Base.logger
    last_event = AppEvent.order(:id).last
    loop do
      events = AppEvent.where('id > ?', last_event)
      events.each do |event|
        puts event.details
        last_event = event
      end
      sleep 1
    end
  end
end

def qbm
  s = Time.now.to_f
  ret = yield
  puts "#{(Time.now.to_f - s).round(3)}s"
  ret
end

# vim: syntax=ruby
