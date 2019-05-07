
require 'pry'

class AppController

    def run
        puts "Welcome to Fest Tracker."
        puts "What would you like to do today?"

       main_menu
    end

    def main_menu
        puts "1. list of location"

        choice = gets.strip.to_i
        # until choice == 3
            case choice
            when 1
              list_locations
            else
                puts "Invalid Entry."
            end
        # end
    end

    def list_locations
        # binding.pry
        new_array =[]
        festivals = Festival.all
        new_array << festivals.each do |fest|
        end
    end

end
