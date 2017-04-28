require 'httparty'

class Kele
  include HTTParty
  
  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: {"email": email, "password": password})
    raise "Invalid email or password" if response.code != 200
    @auth_token = response["auth_token"]
  end
  
  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end