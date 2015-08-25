class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show, :edit, :update, :destroy]

  def index
    @wallets = current_user.wallets
  end

  def show
  end

  def new
    @wallet = current_user.wallets.new
  end

  def edit
  end

  def create
    @wallet = current_user.wallets.new(wallet_params)

    respond_to do |format|
      if @wallet.save
        format.html { redirect_to @wallet, notice: t('.notice') }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to @wallet, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @wallet }
      else
        format.html { render :edit }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wallet.destroy
    respond_to do |format|
      format.html { redirect_to user_wallets_url(@wallet.user_id), notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end

  def wallet_params
    params.require(:wallet).permit(:name, :user_id, :balance)
  end
end
