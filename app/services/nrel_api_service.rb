class NrelApiService					
  def self.call_db(url, params = {})		
    response = connection.get(url) do |request| 		
      request.params = params
      request.params['api_key'] = Rails.application.credentials.nrel[:api_key]
      request.headers['Accept'] = 'application/json'		
    end		
    JSON.parse(response.body, symbolize_names: true)		
  end		
      
  private		
      
  def self.connection		
    Faraday.new('https://developer.nrel.gov')		
  end
end