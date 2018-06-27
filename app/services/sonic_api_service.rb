class SonicApiService

  def self.post_file(url)
    response = conn.post('/analyze/melody') do |f|
      f.params['input_file'] = url
    end
    JSON.parse(response.body, symbolize_names: true)[:melody_result][:notes]
  end

  private

    def self.conn
      Faraday.new('https://api.sonicapi.com', params: params)
    end

    def self.params
      {access_id: ENV['SONIC_API_KEY'], format: 'json'}
    end
end
