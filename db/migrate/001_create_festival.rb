
class CreateFestival < ActiveRecord::Migration

    def change
        create_table :festivals do |t|
            t.string :category
            t.string :name 
            t.datetime :date_time
            t.string :location
        end
    end
end