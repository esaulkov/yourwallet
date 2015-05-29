class Category < ActiveRecord::Base
  has_many :purchases
  
  validates_uniqueness_of :name, case_sensitive: false
  validates_length_of :name, maximum: 50
end
