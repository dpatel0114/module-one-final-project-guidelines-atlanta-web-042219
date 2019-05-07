
class Festival < ActiveRecord::Base

    has_many :reviews
    has_many :consumers, through: :reviews
end