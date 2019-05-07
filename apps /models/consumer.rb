
class Consumer < ActiveRecord::Base

    has many :festival
    has many :consumer through: :review

end