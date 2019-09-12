# This loads the application in the master process before forking
# worker processes
# Read more about it here:
# http://unicorn.bogomips.org/Unicorn/Configurator.html
preload_app true

timeout 30

@app_path = '/home/media/current'

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 2)
working_directory "#{@app_path}"
pid "#{@app_path}/tmp/pids/unicorn.pid"

# This is where we specify the socket.
# We will point the upstream Nginx module to this socket later on
listen "#{@app_path}/tmp/sockets/unicorn.sock", backlog: 1024

# use correct Gemfile on restarts
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{@app_path}/Gemfile"
end

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

# logging
stderr_path 'log/unicorn.stderr.log'
stdout_path 'log/unicorn.stdout.log'