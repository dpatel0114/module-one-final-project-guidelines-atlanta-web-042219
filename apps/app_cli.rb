class AppCLI


  def run
    puts "Welcome to Fest Tracker"
    puts "What would you like to do today?"

    main_menu
  end

  def main_menu
    puts "1 - List all locations"
    puts "2 - Make a profile"
    puts "3 - quit"

      choice = gets.chomp.to_i


      until choice == 3
        case choice
        when 1
          list_locations
        when 2
          new_user
        else
          puts "Unfortunately, that is not one of our options. Please choose again."
        end
      end
    end
    def list_locations
    locations = .all
    location.each do |location|
      puts "The #{fesival.name} is in #{festival.location}"
    end
  end



end
