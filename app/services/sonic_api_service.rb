class SonicApiService

  def self.post_file(file)
    response = conn.post('/analyze/melody', {input_file: upload(file)})
    JSON.parse(response.body, symbolize_names: true)[:melody_result]
  end

  private

    def self.conn
      Faraday.new('https://api.sonicapi.com', params: params) do |f|
        f.request :multipart
        f.request :url_encoded
        f.adapter Faraday.default_adapter
      end
    end

    def self.params
      {access_id: ENV['SONIC_API_KEY'], format: 'json'}
    end

    def self.upload(file)
      Faraday::UploadIO.new(
       file.tempfile.path,
       file.content_type,
       file.original_filename
      )
    end
end
