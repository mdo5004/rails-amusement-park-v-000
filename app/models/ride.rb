class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user


    # How can I get these messages returned to the controller to be displayed in the View?
    
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
            tickets = user.tickets - attraction.tickets
            happiness = user.happiness + attraction.happiness_rating
            nausea = user.nausea + attraction.nausea_rating
            user.update(nausea: nausea, happiness:happiness, tickets:tickets)
#### This wasn't updating when I tested manually, but passed Spec test

            self.save
            response = "Thanks for riding the #{attraction.name}!"
        else
            response = "Sorry. " + response.join(' ')
        end
        return response
    end
end
