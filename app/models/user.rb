class User < ActiveRecord::Base
    has_many :rides 
    has_many :attractions, through: :rides
    validates :name, presence: true 
    has_secure_password
    


    def mood 
        unless admin
            if nausea < happiness
                return "happy"
            else  
                return "sad"
            end 
        end 
    end 
end
