module USaidWat extend self
  def commands
    cmds = []
    this_dir = File.dirname __FILE__
    cmd_dir = File.join this_dir, 'cmd'
    Dir.chdir(cmd_dir) do
      Dir['*.rb'].each do |f|
        cmds << f[0..-4]
      end
    end
    cmds
  end
end
