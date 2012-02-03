class Array
  def longest_subreddit
    max_by { |s| s.first.length }.first
  end
end

# Inspired by: http://nex-3.com/posts/73-git-style-automatic-paging-in-ruby
def run_pager
  return if RUBY_PLATFORM =~ /win32/
  return unless STDOUT.tty?
  
  read, write = IO.pipe
  
  unless Kernel.fork
    STDOUT.reopen(write)
    STDERR.reopen(write) if STDERR.tty?
    read.close
    write.close
    return
  end
  
  STDIN.reopen(read)
  read.close
  write.close
  
  #ENV['LESS'] = 'FSRX'
  
  Kernel.select [STDIN]
  pager = ENV['PAGER'] || 'less'
  exec pager rescue exec '/bin/sh', '-c', pager
end
