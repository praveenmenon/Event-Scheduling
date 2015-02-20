set :stage, :it
set :branch, :master
set :deploy_to, '/u01/apps/qwinix/event-scheduling'
set :log_level, :debug

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
role :app, %w{deploy@54.187.215.99}
role :web, %w{deploy@54.187.215.99}
role :db, %w{deploy@54.187.215.99}
server '54.187.215.99', roles: %w{:web, :app, :db}, user: 'deploy'

set :ssh_options, {
   #verbose: :debug,
   keys: %w(~/.ssh/id_rsa),
   auth_methods: %w(publickey)
}