class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, inverse_of: :wallet, dependent: :destroy

  validates_length_of :name, maximum: 50
  validates_uniqueness_of :name, scope: :user_id
  validates_numericality_of :balance, allow_nil: true
end
