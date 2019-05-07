

class CreateReview < ActiveRecord::Migration 

    def change
        create_table :reviews do |t|
            t.integer :consumer_id
            t.integer :festival_id
            t.text :review_description
            t.float :rating
        end 
    end
end