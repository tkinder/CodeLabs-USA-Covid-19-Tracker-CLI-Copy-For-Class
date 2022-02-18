class CLI
    def run
        scrape
        system('clear')
        CRUD.create_secure_users(User.all)
        greeting
        login
        while menu != 'exit' 
        end
        end_program
    end

    def login
        authenticated = false
        while authenticated != true
            puts "Please login"
            puts "What is your username?"
            username = gets.chomp.downcase
            puts "What is your password?"
            password = gets.chomp.downcase
            if CRUD.authenticate_user(username, password, User.all)
                authenticated = true
            end
        end
    end
    
    def greeting
        puts "Welcome to the Covid-19 CLI Tracker!"
    end

    def end_program
        puts "See ya later!"
    end

    def menu
        list_options
        input = gets.chomp.downcase
        choose_option(input)
        return input;
    end

    def list_options
        puts <<-DOC.gsub /^\s*/, ''
            1. List all states
            2. Top ten states with the most confirmed Covid cases
            3. Top ten states with the least confirmed Covid cases
            4. Top ten states with the most confirmed deaths by Covid
            5. Top ten states with the least confirmed deaths by Covid
            6. List from most to least confirmed Covid cases by region
            7. List from most to least confirmed deaths by Covid by region
            8. Overal USA Statistics
            9. Choose State
            Please enter 'exit' to stop the program.
        DOC
    end

    def choose_option(option)
        case option
        when "1"
            State.all.each_with_index do |state, i|
                puts "#{i+1}. #{state.name}"
            end
            
        when "2"
            states = State.all
            states.sort {|a,b| a.confirmed_cases <=> b.confirmed_cases}
            states[1..10].each_with_index do |state, i| 
              puts "#{i+1}. #{state.name} confirmed cases: #{state.confirmed_cases}"
            end
        end
    end

    def scrape
        Scrapper.scrape_usa
        Scrapper.scrape_states
    end
end