class Distributor < ApplicationRecord
    has_many :manufactors
    has_many :orders
    has_many :stocks
   
end
