class User < ActiveRecord::Base


    has_many :rides
    has_many :attractions, :through => :rides

    has_secure_password

    validates :name, uniqueness: true
    validates :name, presence: true

    def mood
        if nausea && happiness
            m = nausea > happiness ? "sad" : "happy"
        else
            m = "unknown"
        end
        return m
    end
end