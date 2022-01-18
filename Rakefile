require_relative 'lib/extract_data'
require_relative 'lib/database'

require 'rspec/core/rake_task'

db = Database.new('localhost', 5430,
                  'cross_commerce', 'postgres',
                  'caio16532')
extract = ExtractData.new(db)

task :extract do
  puts "Criando banco de dados..."
  db.create_table_numbers
  puts "Banco criado..."
  puts "Executando script..."
  extract.request_data_and_save_database
  puts "Concluído..."
end

task :test do
  puts "Executando testes"
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task["spec"].execute
end