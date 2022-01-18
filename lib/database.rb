require 'pg'
require 'json'

class Database
  attr_reader :db

  def initialize(host, port, db, user, password)
    @db = set_variables(host, port, db, user, password)
  end

  def save_in_database(data, page, status)
    @db.exec_params("insert into numbers (data, page, status) values ($1, $2, $3)",
                    [data.to_json, page, status])
  end

  def get_data(page)
    data = @db.exec_params("select * from numbers where page = ($1)", [page]).entries.first
    JSON.parse! data["data"]
  end

  def create_table_numbers
    @db.exec("create table if not exists numbers(
        id serial primary key,
        data text,
        page int,
        status int
     )")
  end

  private
  def set_variables(host, port, db, user, password)
    begin
      PG.connect(
        host: ENV['DB_HOST'] || host,
        port: ENV['DB_PORT'] || port,
        dbname: ENV['DATABASE'] || db,
        user: ENV['DB_USER'] || user,
        password: ENV['DB_PASS'] || password
      )
    rescue PG::ConnectionBad => e
      puts "Error ao conectar o banco de dados."
    end
  end
end
