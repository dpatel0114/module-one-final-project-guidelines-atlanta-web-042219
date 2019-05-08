require 'pry'

class AppController

    def welcome 
        puts "Welcome to Fest Tracker."
        puts "What would you like to do today?"

    end

    def main_menu
        puts "1. list of locations." 
        puts "2. add reviews."
        puts "3. update reviews."

        choice = gets.strip.to_i
           
        case choice
            when 1
              list_locations
            when 2
              add_reviews
            when 3
                update_reviews
            else 
            puts "Invalid Entry."
        # ends
        end
    end
    
    def list_locations    
        puts "Choose a location: "    
        festivals = Festival.select(:location).distinct
        festivals.each_with_index do |fest,id|
            puts " #{id+1}. #{fest.location}"
        end
        user = gets.strip.to_i
    end

    # def festival_by_category
    # end

    def festival_by_location(location)
        # binding.pry
        count = 1
        case location 
        when 1
            Festival.where(location: "Atlanta, GA").find_each do |fest|
                puts "#{count}.  #{fest.name} - #{fest.date_time}"
                count +=1
            end
        when 2
            Festival.where(location: "New York City, NY").find_each do |fest|
                puts "#{count}.  #{fest.name} - #{fest.date_time}"
                count +=1
            end
        else  
            "Invalid"
        end
    end





    def run
        welcome 
        location = main_menu
        festival_by_location(location)
    end 
    
end
            