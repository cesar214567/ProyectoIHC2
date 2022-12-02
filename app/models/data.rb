class Data
    def self.all
        return self.data
    end
    def self.random(amount,min = 1)
        return self.data.sample(rand(min..amount))
    end 

    def self.one
        return self.data.sample
    end 
end
