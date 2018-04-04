require 'net/smtp'
require 'net/http'
require 'net/https'
require 'uri'
require 'json'

class Samanage

  def initialize(uri, jwt)  
    # Instance variables  
    @samanage_uri = uri
    @samanage_jwt = jwt
  end  

  def createIncident(incident_hash)
    uri = URI.parse(@samanage_uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    header = {'Accept': 'application/vnd.samanage.v2.1+json',
              'Content-Type': 'application/json',
              'X-Samanage-Authorization': @samanage_jwt} # 'Bearer '+Rails.application.secrets.TMJWT}
    preq = Net::HTTP::Post.new(uri.request_uri, header)
    preq.body = incident.to_json
    response = http.request(preq)
    respJson = JSON.parse(response.body).to_hash
    print respJson.to_s
    if response.kind_of? Net::HTTPSuccess
      print "SuccessFully created Samanage Support Ticket\n"
      return true
    else 
      print "There was an Error in creating the Samanage Support ticket\n"
      return false
    end
  end
end