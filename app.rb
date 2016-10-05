require 'sinatra'
require './rater.rb'

class RateMyTeam < Sinatra::Base

  post '/' do
    @rater = Rater.new(params)
    puts "In action"
    haml :rate, :format => :html5
  end
  
end
