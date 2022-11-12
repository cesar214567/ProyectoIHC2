class DataController < ApplicationController
    def index
        data = {}
        data[:fullname] = Faker::Name.name
        data[:age] = (19..50).to_a.sample
        data[:hasTitle] = [true,false].sample && data[:age] > 22
        data[:titleInstitute] = Faker::University.name
        data[:titleName] = "Licenciated in #{["Computer Sciences","Data Sciences","System Engineer","Software Engineer"].sample}"
        data[:languages] = ["spanish","english","portuguese","japanese","french"].sample((1..5).to_a.sample)
        pastJobs = []
        months = 0
        (0..3).to_a.sample.times do 
            job = {}
            job[:companyName] = Faker::Company.name
            job[:months] = (1..12).to_a.sample
            months += job[:months]
            job[:jobPosition] = ["Backend","Frontend","Fullstack","Data Scientist","DevOps","DevSecOps","Pentester","QA"].sample
            job[:Planguage] = Faker::ProgrammingLanguage.name
            pastJobs.push(job)
        end
        data[:pastJobs] = pastJobs
        if (1..10).to_a.sample < 7 
            data[:experienceYears] = (months/12.0).round(2)   
        else
            data[:experienceYears] = ((1..30).to_a.sample/12.0).round(2)
        end
        render json: data
    end
end
