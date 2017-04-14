class User < ActiveRecord::Base

    
    has_many :rides
    has_many :attractions, :through => :rides

    has_secure_password

    validates :name, uniqueness: true
    validates :name, presence: true
    
    def mood
        return nausea > happiness ? "sad" : "happy"
    end
end