class Purchase < ActiveRecord::Base
  belongs_to :category
  has_many :transactions
  
  validates_uniqueness_of :name, scope: :category_id
  validates_length_of :name, maximum: 100
end
