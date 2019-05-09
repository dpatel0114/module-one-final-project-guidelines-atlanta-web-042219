require 'pry'

class AppController

    def welcome 
        puts "Welcome to Fest Tracker."
        puts "What would you like to do today?"

    end

    def main_menu
        puts "1. list of locations of festival." 
        puts "2. add reviews."
        puts "3. Update profile."
        puts "4. Delete profile."

        choice = gets.strip.to_i
           
        case choice
            when 1
              list_locations
            when 2
            puts 'Do you have account with us? Yes/ No'
            ans = gets.strip
            user_profile = current_user(ans)
            add_reviews(user_profile)
            when 3
                update_profile
            when 4
                delete_profile
            else 
            puts "Invalid Entry."
        
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
            "Invalid Entry!!"
        end
    end


    # def festival_by_category()
    #     count =1
    #     case category
    #     when 1
    #         Festival.where(categpry: "music").find_each do |fest|
    #             puts "#{count}. #{fest.name} "
    #             count +=1
    #         end
    #     when 2
    #         Festival.where(category: "art").find_each do |fest|
    #             puts "#{count}.  #{fest.name} "
    #             count +=1
    #         end
        # when 3
    #         Festival.where(category: "religious").find_each do |fest|
    #             puts "#{count}.  #{fest.name} "
    #             count +=1
    #         end
    #     else 
    #         "Invalid Entry!!"
    # end

    

    def add_reviews(user)
        # binding.pry
        puts "Hi!! #{user.name}"
        puts 'Enter festival id: '
        f_id = gets.strip
        puts 'Enter your review descriptions: '
        review = gets.strip
        puts 'Enter your rating: '
        rate = gets.strip.to_f

        Review.create(consumer_id: user.id, festival_id: f_id,review_description: review,
                    rating: rate)

        puts 'Thank you for leaving a review!'
    end


    def current_user(ans)
        if ans.downcase == 'yes'
            puts 'Enter your email: '
            email = gets.strip
            user_profile = Consumer.find_by(contact_email: email)
        else
            puts 'Register your profile!'
            user_profile = create_user
            
        end
        user_profile
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
            puts 'Enter your email: '
            email_id = gets.strip
            user = Consumer.find_by(contact_email: email_id)
            puts "Your current email: #{user.contact_email}"
            puts "Your current name: #{user.name}"

            puts "Enter your new email id: "
            new_email = gets.strip
            user.update(contact_email: new_email)
        else
            current_user('no')

        end
        puts "Thank you for being a valuable member! "
    end 
    


    def delete_profile
        puts "If you want to delete your profile type Yes: "
        ans = gets.strip
        if ans.downcase == "yes"
            puts "Enter your email: "
            email_id = gets.strip
            user = Consumer.find_by(contact_email: email_id)
            user.destroy
            puts "SET TO SEE YOU LEAVE!"
        end
    end

    

    def run
        welcome 
        location = main_menu
        festival_by_location(location)
       
    end 
    
end