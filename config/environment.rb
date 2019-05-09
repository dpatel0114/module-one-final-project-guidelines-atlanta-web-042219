require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

ActiveRecord::Base.logger.level =1


# ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'lib'

