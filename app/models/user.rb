class User < ActiveRecord::Base
    enum role: [:admin, :user]
    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides
    

    def mood
        return nausea > happiness ? "sad" : "happy"
    end

end
