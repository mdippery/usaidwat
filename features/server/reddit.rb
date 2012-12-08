require 'sinatra/base'

class Reddit < Sinatra::Base
  get '/user/*/comments.json' do
    root = File.expand_path('../../', __FILE__)
    json = File.read(File.join(root, 'fixtures', 'comments.json'))
    content_type :json
    json
  end
  
  run! if app_file == $0
end
