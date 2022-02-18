require 'bcrypt'
module CRUD
    def self.create_hash_digest(password)
        BCrypt::Password.create(password)
    end

    def self.verify_hash_digest(password)
        BCrypt::Password.new(password)
    end

    def self.create_secure_users(users)
        users.each do |user_record|
            user_record[:password] = create_hash_digest(user_record[:password])
        end
    end

    def self.authenticate_user(username, password, users)
        users.each do |user_record|
            if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password 
                return user_record
            end
        end
        puts "Crendtials not correct"
    end
end
