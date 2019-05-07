
class Consumer < ActiveRecord::Base

    has_many :reviews
    has_many :festivals, through: :reviews

end