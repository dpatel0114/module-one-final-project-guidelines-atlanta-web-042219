
class CreateConsumer < ActiveRecord::Migration 

    def change
        create_table :consumers do |t|
            t.string :name 
            t.string :contact_email
    end

    end
end