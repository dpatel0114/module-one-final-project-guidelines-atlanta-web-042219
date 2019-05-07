
class Festival < ActiveRecord::Base

    has many :reviews
    has many :consumers, through: :reviews
ends