class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :get_transactions, only: [:index]

  respond_to :html, :js

  def index
  end

  def show
  end

  def new
    @transaction = current_user.transactions.new
  end

  def edit
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { render :show, notice: t('.notice') }
        format.js   {}
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @transaction.update_attributes(transaction_params)
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { render :show, notice: t('.notice') }
        format.js   {}
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: t('.notice') }
      format.js   {}
      format.json { head :no_content }
    end
  end

  private
    
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).
      permit(:sum, :date_time, :side, :inner, :wallet_id, :purchase_id)
  end

  def get_transactions
    @page_size ||= 10
    @page_number = params[:page_number] || session[:page_number] || 0
    @page_number = @page_number.to_i
    session[:page_number] = @page_number
    offset = @page_size * @page_number
    @transactions = current_user.transactions.order(id: :desc).
                    limit(@page_size).offset(offset).
                    includes(:purchase).includes(:wallet)
    @transactions_count = current_user.transactions.count
  end
end
