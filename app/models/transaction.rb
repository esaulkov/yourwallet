class Transaction < ActiveRecord::Base
  belongs_to :wallet
  belongs_to :purchase

  before_update     :save_transaction_sum
  after_create      :add_to_wallet
  after_update      :add_to_wallet
  after_destroy     :remove_from_wallet

  validates_numericality_of :sum
  validates_presence_of :wallet_id
  validates_presence_of :purchase_id

  private
 
  def get_absolute_sum
    self.sum = self.sum.abs
  end

  def add_to_wallet
    wallet.increment(:balance, sum)
    wallet.save
  end

  def save_transaction_sum
    @temp_trans = Transaction.find(id)
    wallet.decrement(:balance, @temp_trans.sum)
    wallet.save
  end

  def remove_from_wallet
    wallet.decrement(:balance, sum)
    wallet.save
  end
end
