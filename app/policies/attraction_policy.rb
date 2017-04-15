class AttractionPolicy < ApplicationPolicy
    attr_reader :user, :attraction
    def initialize(user, attraction)
        super(user, attraction)
        @attraction = record
    end
    
    def new?
        user.admin
    end
    def create?
        user.admin
    end
    def edit?
        user.admin
    end
    def update?
        user.admin
    end
    def destroy?
        user.admin
    end
end