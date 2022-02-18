require_relative "./concerns/grabable.rb"
class Country
    include Grabable::ClassMethods
    attr_accessor :name, :confirmed_cases, :overall_deaths, :recoveries

    @@Countries = []

    def initialize(attributes)
        attributes.each {|key, value| self.send("#{key}=", value)}
        save
    end

    def self.all
        @@Countries
    end
end
