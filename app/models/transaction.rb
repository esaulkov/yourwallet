class Transaction < ActiveRecord::Base
  belongs_to :wallet
  belongs_to :purchase
end
