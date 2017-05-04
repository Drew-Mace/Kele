module Message
  
  def get_messages(page)
    response = self.class.get(api_url("message_threads"), values: {"page": page}, headers: {"authorization" => @auth_token})
    JSON.parse(response.body)
  end
  
  def create_message(sender, recipient_id, token, subject, stripped_text)
    response = self.class.post(api_url("messages"), 
    ## required info to send a message 
    :query => { :sender => sender, :recipient_id => recipient_id, :token => token, :subject => subject, :stripped_text => stripped_text  },
    
    headers: {"authorization" => @auth_token})
    
    JSON.parse(response.body)
  end

end
    