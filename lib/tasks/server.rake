namespace :server do
  desc 'Stop Rails server'
  task :stop do
      pid_file = 'tmp/pids/server.pid'
      pid = File.read(pid_file).to_i
      Process.kill 9, pid
      File.delete pid_file
  end
end
