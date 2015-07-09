class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = current_user
    @last_transactions = @user.get_last_transactions
    this_month = @user.get_this_month_transactions.to_a.sum(&:sum)
    flash.now[:alert] = t('.alert') if this_month > @user.limit
  end

  def edit
  end
  
  def update
  end

  def delete
  end
end
 
