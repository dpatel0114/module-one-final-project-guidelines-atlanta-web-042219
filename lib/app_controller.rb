
require 'pry'
require 'pastel'



class AppController
    @@pastel = Pastel.new
245
    def welcome 
        welcome_str = "Welcome to Fest Tracker"
        puts @@pastel.decorate(" "*30 + "*"*50,:green)
        puts " "*45 + @@pastel.decorate("#{welcome_str}",:blue,:bold,:underline)
        puts @@pastel.decorate(" "*30 + "*"*50,:green) + "\n"
        `say #{welcome_str}`
        puts @@pastel.decorate("===> What would you like to do today? <===",:cyan,:bold)
        `say  "What would you like to do today?"`
    end

    def main_menu
        choice = 0

        until choice == 5
            
            print "1. list of locations of festival.\t"
            print "2. add reviews. \t"
            print "3. Update profile.\t"
            puts  "4. Delete profile.\t"
            puts  "5.  exit"

            print @@pastel.decorate("Enter Your Number : ",:magenta)
            choice = gets.strip.to_i

            case choice
                when 1
                    location = list_locations
                    puts ""
                    category,location = festival_by_location(location)
                    festival_by_category(category,location)
                when 2
                    puts "\n"  
                    print @@pastel.decorate('Do you have account with us? Yes/ No: ',:blue)
                    ans = gets.strip
                    user_profile = current_user(ans)
                    add_reviews(user_profile)
                when 3
                    update_profile
                when 4
                    delete_profile
            end
            puts ""
       

        end
        puts @@pastel.decorate("\t\t\tGood Bye! Have a Good Day!! \n", :yellow,:bold)
        `say "Good Bye! Have a Good Day!"`
    end


    def list_locations
        festivals = Festival.select(:location).distinct
        festivals.each_with_index do |fest,id|
            puts "\t #{id+1}. #{fest.location}"
        end
        print @@pastel.decorate("Choose a location : " ,:magenta) 
        ans = gets.strip.to_i
    end


    def festival_by_location(location)
        # binding.pry

        count = 1
        case location
        when 1
            Festival.where(location: "Atlanta, GA").find_each do |fest|
                puts "\t #{count}.  #{fest.category} "
                count +=1
            end
        when 2
            Festival.where(location: "New York City, NY").find_each do |fest|
                puts "\t #{count}.  #{fest.category} "
                count +=1
            end
        else
            "Invalid Entry!!"
        end
        print @@pastel.decorate("Choose a category : ",:magenta)
        ans = gets.strip.to_i
        return ans, location
    end


    def festival_by_category(category,location)

        if location ==1
            location_name = "Atlanta, GA"
        else
            location_name = "New York City, NY"
        end 
        count =1
        case category
        when 1
            Festival.where(category: "music",location:location_name).find_each do |fest|
                puts "\t\t#{count}. #{fest.name} => #{fest.date_time}"
                count +=1
            end
        when 2
            Festival.where(category: "art",location:location_name).find_each do |fest|
                puts "\t\t#{count}.  #{fest.name} => #{fest.date_time}"
                count +=1
            end
        when 3
            Festival.where(category: "religious",location:location_name).find_each do |fest|
                puts "\t\t#{count}.  #{fest.name} => #{fest.date_time}"
                count +=1
            end
        else
            "Invalid Entry!!"
        end
    end



    def add_reviews(user)
        # binding.pry
        puts ""
        puts "\t\t Hi!! #{user.name}"
        `say "Hi!! #{user.name}"`
        puts ""
        print @@pastel.decorate('Enter festival id : ',:magenta)
        f_id = gets.strip
        print @@pastel.decorate('Enter your review descriptions : ',:magenta)
        review = gets.strip
        print @@pastel.decorate('Enter your rating: ',:magenta)
        rate = gets.strip.to_f

        Review.create(consumer_id: user.id, festival_id: f_id,review_description: review,
                    rating: rate)

        puts @@pastel.decorate(" *** Thank you for leaving a review! *** ",:yellow)
    end


    def current_user(ans)
        #Test
        if ans.downcase == 'yes'
            puts "\n"
            print  @@pastel.decorate("Enter your email: ",:magenta)
            email = gets.strip
            user_profile = Consumer.find_by(contact_email: email)
        else
            puts "\n"
            puts "Register your profile!"
            user_profile = create_user

        end
        user_profile
    end


    def create_user
        print @@pastel.decorate('Enter Your Full Name:',:magenta)
        u_name = gets.strip
        puts "\n"
        print @@pastel.decorate('Enter your email:', :magenta)
        email_id = gets.strip
        Consumer.create(name: u_name, contact_email: email_id)
    end


    def update_profile

        puts "\n"
        print @@pastel.decorate('Do you have a account with us? Yes/No : ',:blue)
        ans = gets.strip
        if ans.downcase == 'yes'
            print @@pastel.decorate('Enter your email: ',:magenta)
            email_id = gets.strip
            user = Consumer.find_by(contact_email: email_id)
            puts""
            puts "\t\t Your current email: #{user.contact_email}"
            puts "\t\t Your current name: #{user.name}"
            puts ""
            print @@pastel.decorate("Enter your new email id: ",:magenta)
            new_email = gets.strip
            user.update(contact_email: new_email)
        else
            current_user('no')

        end
        puts "\n"
        puts @@pastel.decorate(" *****  Thank you for being a valuable member! ***** ",:yellow)
    end 
    

    def delete_profile
        print @@pastel.decorate("If you want to delete your profile type Yes: ",:blue)
        ans = gets.strip
        if ans.downcase == "yes"
            print @@pastel.decorate("Enter your email : ",:magenta)
            email_id = gets.strip
            user = Consumer.find_by(contact_email: email_id)
            user.destroy
            puts "\n"
            puts @@pastel.decorate(" ***** SAD TO SEE YOU LEAVE! ***** ",:yellow)
        end
    end



    def run
        welcome
        main_menu 
    end 

end

