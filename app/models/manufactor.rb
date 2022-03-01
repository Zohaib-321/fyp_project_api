class Manufactor < ApplicationRecord
    belongs_to :distributor , optional:true
    has_many :medicines
    
end
