
class Review < ActiveRecord::Base
    belongs to :consumer
    belongs to :festival
end