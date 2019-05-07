require_relative '../config/environment'
require_relative "../lib/consumer.rb"

puts "HELLO WORLD"


ans = Consumer.find_by(name:'krunal').contact_email
puts ans

