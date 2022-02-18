class User 
    @@users = [
        {username: "test", password:"password"}
    ]

    attr_accessor :username, :password
    def initialize(username, passsord)
        @username = username
        @password = password
    end
    def self.all 
        return @@users
    end
end