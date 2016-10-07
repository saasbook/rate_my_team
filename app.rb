require 'rubygems'
require 'bundler'
Bundler.require

require 'byebug'
require './figaro_support.rb'
require './rater.rb'
require 'uri'

class RateMyTeam < Sinatra::Base
  configure do
    enable :sessions
    Figaro.load
  end

  post '/xx' do
    params.each_pair do |k,v|
      puts %Q{<input type="hidden" name="#{k}" value="#{URI.unescape v}"/>\n}
    end
  end

  post '/' do
    @rater = Rater.new(params)
    haml :rate, :format => :html5
  end
  
end

