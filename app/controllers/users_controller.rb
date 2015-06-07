class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = current_user
    @last_transactions = @user.get_last_transactions
  end

  def edit
  end
  
  def update
  end

  def delete
  end
end
 
