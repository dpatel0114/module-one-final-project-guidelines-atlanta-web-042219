
class Review < ActiveRecord::Base
    belongs_to :consumer
    belongs_to :festival
end