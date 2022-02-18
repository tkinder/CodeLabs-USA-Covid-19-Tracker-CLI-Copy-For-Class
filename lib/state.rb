class State < Country
    @@states = []
    
    def initialize(attributes)
        super
    end

    def self.all
        @@states
    end
end
