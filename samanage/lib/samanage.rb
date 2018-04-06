require 'samanage/configuration'
require 'samanage/version'
require 'net/smtp'
require 'net/http'
require 'net/https'
require 'uri'
require 'json'

module Samanage
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.createIncident(incident_hash)
    uri = URI.parse(@configuration.uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    header = {'Accept': 'application/vnd.samanage.v2.1+json',
              'Content-Type': 'application/json',
              'X-Samanage-Authorization': @configuration.jwt} # 'Bearer '+Rails.application.secrets.TMJWT}
    preq = Net::HTTP::Post.new(uri.request_uri, header)
    preq.body = incident_hash.to_json
    response = http.request(preq)
    respJson = JSON.parse(response.body).to_hash
    print respJson.to_s
    if response.kind_of? Net::HTTPSuccess
      print "SuccessFully created Samanage Support Ticket.\n"
      return true
    else 
      print "There was an Error in creating the Samanage Support ticket.\n"
      return false
    end
  end
end
