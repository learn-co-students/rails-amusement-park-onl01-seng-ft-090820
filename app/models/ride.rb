class Ride < ActiveRecord::Base

    belongs_to :user
    belongs_to :attraction
    
    def take_ride
        if !enough_tickets && !tall_enough
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !enough_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !tall_enough
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            user.update(tickets: updated_tickets, nausea: updated_nausea, happiness: updated_happiness)
            "Thanks for riding the #{self.attraction.name}!"
        end
        
    end
    
    private
    
    def enough_tickets
        (user.tickets - attraction.tickets) >= 0
    end
    
    def tall_enough
        user.height > attraction.min_height
    end
    
    def updated_tickets
        user.tickets = user.tickets - attraction.tickets
    end
    
    def updated_nausea
        user.nausea = user.nausea + attraction.nausea_rating
    end
    
    def updated_happiness
        user.happiness = user.happiness + attraction.happiness_rating
    end


end
