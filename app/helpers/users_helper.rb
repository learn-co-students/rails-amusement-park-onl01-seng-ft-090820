module UsersHelper

    def admin(user)
        if user.admin == true 
            return "ADMIN"
        end 
    end 
end
