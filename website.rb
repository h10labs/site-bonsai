require 'sinatra'
require 'bonsai'

Bonsai.root_dir = Dir.pwd

module Bonsai
  class Server < Sinatra::Base
    enable :static
    disable :logging
    set :public, File.join(File.dirname(__FILE__), "output")
    
    get '/' do
      begin
        Page.find("index").render
      rescue Exception => e
        not_found
      end
    end

    get '/*' do
      begin
        Page.find(params[:splat].join).render
      rescue Exception => e
        not_found
      end
    end
  end
end