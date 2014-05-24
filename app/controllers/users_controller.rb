class UsersController < ApplicationController
  expose(:user)
  expose(:users)
  expose(:advertises) { user.advertises }

  def index

  end

  def show
    
  end

end
