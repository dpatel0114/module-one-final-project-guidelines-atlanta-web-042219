require_relative "../lib/festival.rb"
require_relative "../lib/consumer.rb"
require_relative "../lib/review.rb"







#* Festival
Festival.create(category: "music", name: "bonaroo", date_time: "2019-12-05", location: "Atlanta, GA" )
Festival.create(category: "art", name: "piedmont park arts festival", date_time: "2019-09-09", location: "Atlanta, GA" )
Festival.create(category: "religious", name: "atlanta jewish life festival", date_time: "2019-11-20", location: "Atlanta, GA" )

Festival.create(category: "music", name: "cityparks summer stage", date_time: "2019-05-08", location: "New York City, NY")
Festival.create(category: "art", name: "downtown urban arts festival", date_time: "2019-03-21", location: "New York City, NY")
Festival.create(category: "religious", name: "holi-color", date_time: "2019-08-08", location: "New York City, NY")


#* Review
Review.create(consumer_id: 1, festival_id: 1, review_description: "really good, had a fun", rating: 9.0)
Review.create(consumer_id: 2, festival_id: 2, review_description: "it was really fun, so much offer", rating: 10.0)
Review.create(consumer_id: 3, festival_id: 3, review_description: "felt like it was to conservative for our taste", rating: 4.0)
Review.create(consumer_id: 1, festival_id: 4, review_description: "felt extremely accomodating", rating: 8.0)
Review.create(consumer_id: 2, festival_id: 5, review_description: "poor community involvement", rating: 3.0)
Review.create(consumer_id: 3, festival_id: 6, review_description: "the festival was educational and inspiring" rating: 9.0)

#* Consumer
Consumer.create(name: ‘Shara Brown’ ,contact_email: ‘sbrown@gmail.com’)
Consumer.create(name: ‘John Michael’ ,contact_email: ‘jmichael@gmail.com’)
Consumer.create(name: ‘Stuart Johnson’ ,contact_email: ‘sjohnson@gmail.com’)

