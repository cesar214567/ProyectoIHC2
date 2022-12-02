class JobPositionRequirement
    @@last = 0

    def self.last
        return @@last
    end

    def self.generate
        data = {}
        data[:job_position] = JobPosition.one
        data[:required_experience] = rand(0.5..3.0).round(2)
        data[:required_title] = [false,true].sample
        data[:companyName] = Faker::Company.name
        @@last = data
    end

end