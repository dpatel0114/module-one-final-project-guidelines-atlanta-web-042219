require 'pry'

class AppController

    def welcome 
        puts "Welcome to Fest Tracker."
        puts "What would you like to do today?"

    end

    def main_menu
        puts "1. list of locations for festival." 
        puts "2. add reviews."
        puts "3. Update/Delete profile"

        choice = gets.strip.to_i
           
        case choice
            when 1
              list_locations
            when 2
            puts 'Are you a consumer? Yes/ No'
            ans = gets.strip
            user_details = current_user(ans)
            add_reviews(user_details)
            when 3
                update_profile
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

    def add_reviews(user)
        puts "Hi!! #{user.name}"
        puts 'Enter festival id : '
        f_id = gets.strip
        puts 'Enter your review descriptions: '
        review = gets.strip
        puts 'Enter your rating: '
        rate = gets.strip.to_f

        Review.create(consumer_id:user.id, festival_id: f_id,review_description:review,
                    rating:rate)
        
        puts 'Thank you for leaving a review!'


    end

    def current_user(answer)
        if ans.downcase == 'yes'
            puts 'Enter your email: '
            email = gets.strip
            user_details = Consumer.find_by(contact_email:email)
        else
            puts 'You have to register to leave Review!'
            user_details = create_user
            
        end
        user_details
    end


    def create_user
        puts 'Enter Your Full Name:'
        u_name = gets.strip
        puts 'Enter your email:'
        email_id = gets.strip
        Consumer.create(name: u_name, contact_email: email_id)
    end

    def update_profile
        puts 'Do you have a account with us? Yes/No :'
        ans = gets.strip
        if ans.downcase == 'yes'
            puts 'Enter your email : '
            email_id = gets.strip
            user = Consumer.find_by(contact_email: email_id)
            puts "Your current email : #{user.contact_email}"
            puts "Your current name : #{user.name}"

            puts "Enter your new email id :"
            new_email = gets.strip
            user.update(contact_email:new_email)
        else
            current_user('no')

        end

        puts "Thank you for being valvuable member!!"
    end 

    def run
        welcome 
        location = main_menu
        festival_by_location(location)
    end 
    
end
            