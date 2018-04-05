module Samanage
  class Configuration
    attr_accessor :samanage_uri, :samanage_jwt

    def initialize
      @samanage_uri = nil
      @samanage_jwt = nil
    end
  end
end