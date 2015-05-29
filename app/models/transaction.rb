class Transaction < ActiveRecord::Base
  belongs_to :wallet
  belongs_to :purchase

  before_validation :get_absolute_sum
  
  validates_numericality_of :sum, greater_than_or_equal_to: 0.01
#  validates_format_of :date_time, with:
  validates_presence_of :wallet_id
  validates_presence_of :purchase_id
  
  def get_absolute_sum
    self.sum = self.sum.abs
  end
end
