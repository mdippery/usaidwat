require 'sinatra/base'

class Reddit < Sinatra::Base
  get '/user/*/comments.json' do
    user = params[:splat].first
    puts user
    root = File.expand_path('../../', __FILE__)
    json = File.read(File.join(root, 'fixtures', "#{user}.json"))
    content_type :json
    json
  end
  
  run! if app_file == $0
end
