# Patch to make Figaro work with Sinatra (vs Rails)

require 'figaro'

module Figaro
  class Application
    def path
      @path ||= File.join(RateMyTeam.settings.root, "application.yml")
    end
    def environment
      RateMyTeam.settings.environment
    end
  end
end

