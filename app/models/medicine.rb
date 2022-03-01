class Medicine < ApplicationRecord
    belongs_to :manufactor, optional:true
    
end
