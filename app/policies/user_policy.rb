class UserPolicy < ApplicationPolicy

    attr_reader :user, :user_model
    def initialize(user, user_model)
        super(user, user_model)
        @user_model = record
    end
    def index?
        @user.admin || @user 
    end
    def show?
        @user.admin || @user_model == @user
    end
    
end
