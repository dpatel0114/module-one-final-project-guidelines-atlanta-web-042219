require_relative '../config/environment'

require_relative '../app_cli.rb'=======
require_relative "../lib/consumer.rb"
require_relative "../lib/festival.rb"
require_relative "../lib/review.rb"



# puts "HELLO WORLD"




AppController.new.run


# ans = Consumer.find_by(name:'krunal').contact_email
# puts ans
