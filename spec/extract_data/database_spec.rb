require 'database'

describe Database do

  before(:each) do
    @db = Database.new('localhost', 5430,
                       'cross_commerce', 'postgres',
                       'caio16532')
  end

  it 'should create table numbers' do
    @db.create_table_numbers
    sql = @db.db.exec("SELECT table_name FROM
                          information_schema.tables
                          WHERE table_schema='public'")
    table_name = sql.entries.first["table_name"]

    expect("numbers").to eql(table_name)
  end
end
