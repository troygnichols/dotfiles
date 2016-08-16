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
end

def fake_process_instructions(sleep_seconds: 5, status: Instruction::INSTRUCTION_STATUS_FINISHED)
  while true
    now = DateTime.current
    pending_instructions = Instruction.where(status: (0..2), delay_run_time: nil)

    pending_instructions.where({
      instruction_type: Instruction::INSTRUCTION_TYPE_TRANSMIT
    }).includes(:controller).find_each do |instr|
      instr.controller.update!(has_unsent_changes: false)
    end

    pending_instructions.update_all({
      status:     status,
      started_at: now,
      ended_at:   now + 15.minutes
    })

    sleep(sleep_seconds)
  end
end

def qbm
  s = Time.now.to_f
  ret = yield
  puts "#{(Time.now.to_f - s).round(3)}s"
  ret
end

# vim: syntax=ruby
