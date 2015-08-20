class UsersController < ApplicationController
  def show
    @last_transactions = current_user.get_last_transactions
    flash.now[:alert] = t('.alert') if current_user.has_overdraft?
  end
end
 
