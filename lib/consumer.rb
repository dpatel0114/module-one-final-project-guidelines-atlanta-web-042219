
class Consumer < ActiveRecord::Base

    has_many :festival
    has_many :consumer, through: :review

end