
class Consumer < ActiveRecord::Base

    has_many :review
    has_many :festival, through: :review

end

