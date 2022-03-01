class Stock < ApplicationRecord
    belongs_to :distributor, optional:true
    
end
