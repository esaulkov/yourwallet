class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:index, :new, :create]

  def index
    @purchases = @category.purchases
  end

  def show
    @transactions = @purchase.transactions
  end

  def new
    @purchase = @category.purchases.new
  end

  def edit
  end

  def create
    @purchase = @category.purchases.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: t(".notice") }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: t(".notice") }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def purchase_params
    params.require(:purchase).permit(:name, :category_id)
  end
end
