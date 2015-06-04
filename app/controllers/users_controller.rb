class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = current_user
    @wallets = Wallet.select(:id, :name, :balance).where(user_id: @user.id)
    @wallet_ids = Wallet.select(:id).where(user_id: @user.id)
    @last_transactions = Transaction.joins(:wallet, :purchase).select('distinct transactions.*, wallets.name as wallet_name, purchases.name as purchase_name').where(wallet_id: @wallet_ids).order(date_time: :desc).limit(5)
  end

  def edit
  end
  
  def update
  end

  def delete
  end
end
 
