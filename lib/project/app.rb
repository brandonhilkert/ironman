begin
  require 'pry'
rescue LoadError
end

module Project
  class App < Sinatra::Base
    set :root, Project.root
    enable  :method_override
    mime_type :appcache, "text/cache-manifest"

    set :sprockets, Sprockets::Environment.new(root) { |env|
      env.append_path(root.join('assets', 'stylesheets'))
      env.append_path(root.join('assets', 'javascripts'))
    }

    configure :development do
      register Sinatra::Reloader
    end

    helpers do
      def asset_path(source)
        "/assets/" + settings.sprockets.find_asset(source).digest_path
      end
    end

    get '/offline.appcache' do
      content_type :appcache
      erb :"offline.appcache", layout: false
    end

    get '/' do
      erb :index
    end
  end
end