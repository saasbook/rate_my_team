# Patch to make Figaro work with Sinatra (vs Rails)
# see https://github.com/chytreg/sinatra-figaro/blob/master/application.rb

module Figaro
  def path
    @path ||= File.join(Application.settings.root, "application.yml")
  end

  def environment
    Application.settings.environment
  end
end

Figaro.env.each do |key, value|
  ENV[key] = value unless ENV.key?(key)
end
