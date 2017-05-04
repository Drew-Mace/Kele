require 'httparty'
require 'json'
require './lib/roadmap.rb'
require './lib/message.rb'

class Kele
  include HTTParty
  include Roadmap
  include Message
  
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
  
  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
    response = self.class.post(api_url("checkpoint_submissions"), 
    :query => { :checkpoint_id => checkpoint_id, :assignment_branch => assignment_branch, :assignment_commit_link => assignment_commit_link, :comment => comment, :enrollment_id => enrollment_id },
    
    headers: {"authorization" => @auth_token})
    
    JSON.parse(response.body)
  end
  
  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end