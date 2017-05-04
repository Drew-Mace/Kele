require 'httparty'
require 'json'

class Kele
  include HTTParty
  
  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: {"email": email, "password": password})
    raise "Invalid email or password" if response.code != 200
    @auth_token = response["auth_token"]
  end
  
  def get_me
    response = self.class.get(api_url("users/me"), headers: {"authorization" => @auth_token})
    JSON.parse(response.body)
  end
  
  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: {"authorization" => @auth_token})
    JSON.parse(response.body)
  end
  
  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end