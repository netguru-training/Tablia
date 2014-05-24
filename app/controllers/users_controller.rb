class UsersController < ApplicationController
  expose(:user)
  expose(:users)
  expose(:advertises) { user.advertises.all }

  def index

  end

  def show
    
  end

end
