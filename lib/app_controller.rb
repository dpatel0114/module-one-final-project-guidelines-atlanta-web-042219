require 'pry'

class AppController

    def run 
        puts "Welcome to Fest Tracker."
        puts "What would you like to do today?"

         main_menu
    end

    def main_menu
        puts "1. list of locations." 
        puts "2. add reviews."
        puts "3. update reviews."

        choice = gets.strip.to_i
        until choice == 4 
        case choice
            when 1
              list_locations
            when 2
              add_reviews
            when 3
                update_reviews
            else 
            puts "Invalid Entry."
        end
        end
    end
    
    def list_locations
        # binding.prys
        new_array =[]
        festivals = Festival.all
        festivals.each do |fest|
            fest
        end
      
    end
        # new_array = []
        # festivals = Festival.all
        # new_array << festivals.map do |fest|
        #    puts  "#{fest.location}."
        # end
    
end
            # puts "1. Atlanta, GA"
            # puts "2. New York City, NY"

        #     choice = gets.strip.to_i 
        #     case choice
        # when 1 
        #     list_category_by_location
        # when 2 
        #     list_category_by_location
        # else 
        #     "Invalid Entry."

        # end
        # end


        # map { |fest| fest.location}.uniq
        #      "#{fest.location}"