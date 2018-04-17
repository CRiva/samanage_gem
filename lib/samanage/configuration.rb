module Samanage
  class Configuration
    attr_accessor :uri, :jwt

    def initialize
      @uri = nil
      @jwt = nil
    end
  end
end