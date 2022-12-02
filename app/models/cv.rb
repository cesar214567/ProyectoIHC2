class Cv
    def self.generate_cv  
        last_job_position = JobPositionRequirement.last
        data = {}
        data[:fullname] = Faker::Name.name
        data[:age] = (19..50).to_a.sample
        data[:hasTitle] = [true,false].sample && data[:age] > 22
        data[:titleInstitute] =  data[:hasTitle]? Faker::University.name : " "
        data[:titleName] = data[:hasTitle]?  "Licenciated in #{Title.one}" : " "
        data[:languages] = Language.random(5,1)
        pastJobs = []
        months = 0
        usefull_months = 0
        (0..3).to_a.sample.times do 
            job = {}
            job[:companyName] = Faker::Company.name
            job[:months] = (1..18).to_a.sample
            if rand(0.0..1.0) < 0.33 
                job[:jobPosition] = last_job_position[:job_position]
                usefull_months += job[:months]
            else
                job[:jobPosition] = JobPosition.one
            end
            months += job[:months]
            job[:Planguage] = ProgrammingLanguage.one
            pastJobs.push(job)
        end
        data[:pastJobs] = pastJobs
        if (1..10).to_a.sample < 7 
            data[:experienceYears] = (months/12.0).round(2)
        else
            data[:experienceYears] = ((1..30).to_a.sample/12.0).round(2)
        end
        if (usefull_months/12.0).round(2) >= last_job_position[:required_experience] && data[:hasTitle] == last_job_position[:required_title]
            data[:is_valid] = true
        else
            data[:is_valid] = false
        end
        return data
    end

end