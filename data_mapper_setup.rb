require 'data_mapper'
# require_relative '.env'

ENV = {'DATABASE_URL'=>'postgres://erdurltbbytqbf:USEjxcXHR4_Tl7y_tJGa7iQFLO@ec2-54-243-149-147.compute-1.amazonaws.com:5432/dek0e3j6uk9omj'}

env = 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")

require './app/models/link' # require each model individually - the path may vary depending on your file structure.
require './app/models/tag'
# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!
