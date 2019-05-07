

class CreateReview < ActiveRecord::Migration 

    def change
        creat_table :reviews do |t|
            t.integer :consumer_id
            t.integer :festival_id
            t.float :rating
        end
    end
end