require 'pry'
class Attraction < ActiveRecord::Base
    has_many :rides
    has_many :users, :through => :rides

    validates :name, presence: true

    after_update :update_ride_count

    def users=(id)
        if User.find_by(id: id)
            ride = rides.create(user_id: id)
        end
    end
    def ride_count
        if @ride_count.nil?
            update_ride_count
        end
        @ride_count
    end
    def take_ride(user_id)
        ride = rides.build(user_id:user_id)
        ride.take_ride
    end
    private
    def update_ride_count
        @ride_count = rides.count 
    end
end
