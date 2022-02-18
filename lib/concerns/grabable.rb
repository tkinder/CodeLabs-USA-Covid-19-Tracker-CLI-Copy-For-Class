module Grabable
    module ClassMethods
        def save 
            self.class.all << self 
            all = self.class.all.sort {|a,b| a.name <=> b.name}
        end
    end
end