class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user


    def take_ride
        response = []
        if user.tickets < attraction.tickets 
            response << "You do not have enough tickets to ride the #{attraction.name}."
        end
        if user.height < attraction.min_height
            response << "You are not tall enough to ride the #{attraction.name}."
        end
        
        if response == []
            # user can ride
            user.tickets = user.tickets - attraction.tickets
            user.happiness = user.happiness + attraction.happiness_rating
            user.nausea = user.nausea + attraction.nausea_rating
            user.save
            return true
        else
            response = "Sorry. " + response.join(' ')
        end
        return response
    end
end
