require_relative "../lib/festival.rb"
require_relative "../lib/consumer.rb"
require_relative "../lib/review.rb"



Festival.create(category: "music", name: "bonaroo" , date_time: "2019-12-05" , location: "Atlanta, GA" )

Review.create(consumer_id: 1, festival_id: 1, review_description: "really good, had a fun", rating: 9.0)

Consumer.create(name: "Shara Brown" ,contact_email: "sbrown@gmail.com")