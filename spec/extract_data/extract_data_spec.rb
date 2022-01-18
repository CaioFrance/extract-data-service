require 'extract_data'
require 'json'
require 'database'

describe ExtractData do
  before(:each) do
    @db = Database.new('localhost', 5430,
                       'cross_commerce', 'postgres',
                       'caio16532')
    @instance = ExtractData.new(@db)
  end

  it 'should get the data in request and return status 200' do
    page = 1
    data = @instance.request_data(page)
    status = data["status"]

    expect(status).to be 200
  end

  it 'should save data in database' do
    page = 10
    data = @instance.request_data(page)

    @db.save_in_database(data["numbers"], page, data["status"])

    data_in_database = @db.get_data(page)

    expect(data_in_database).to match_array data["numbers"]
  end

  it 'should stop search if data is empty' do
    page = 9999
    data = {}
    loop do
      data = @instance.request_data(page)

      break if data["numbers"].eql? []
      page+=1
    end

    expect(data["numbers"]).to match_array([])
  end
end