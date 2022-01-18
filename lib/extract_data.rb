require "faraday"
require "faraday/retry"
require "json"
require_relative "database"

class ExtractData

  attr_reader :conn

  def initialize(database)
    @conn = Faraday.new("http://challenge.dienekes.com.br/api/numbers") do |f|
      f.response :json
      f.use Faraday::Response::RaiseError
      f.request :retry
    end
    @db = database
  end

  def request_data(page)
    data = {}
    begin
      response = @conn.get("?page=#{page}")
    rescue Faraday::ServerError
      retry
    ensure
      data["numbers"] = response.body["numbers"]
      data["status"] = response.status
    end

    data
  end

  def request_data_and_save_database
    page = 1
    loop do
      data = request_data(page)

      break if data["numbers"].eql? []

      @db.save_in_database(data["numbers"].join(','), page, data["status"])
      page+=1
    end
  end
end
