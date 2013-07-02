class Parser

  def self.parse(endpoint_url)

    json_unparsed = Typhoeus.get(endpoint_url)
    json_string = json_unparsed.options[:response_body]

  end

end