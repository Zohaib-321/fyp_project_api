class Order < ApplicationRecord
belongs_to :distributor, optional: true
belongs_to :medstore, optional: true

end
