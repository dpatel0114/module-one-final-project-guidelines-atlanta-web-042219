require_relative '../config/environment'
# require_relative '../lib/consumer.rb'
# require_relative '../lib/festival.rb'
# require_relative '../lib/review.rb'
require_relative '../lib/app_controller.rb'


# puts "HELLO WORLD"

AppController.new.run



# ans = Consumer.find_by(name:'krunal').contact_email
# puts ans
