class Attraction < ApplicationRecord
    has_many :rides 
    has_many :users, through: :rides 
    # validates_associated :rides 
    validates :name, :min_height, :nausea_rating, :happiness_rating, presence: true 
end
