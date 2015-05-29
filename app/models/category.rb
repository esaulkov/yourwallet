class Category < ActiveRecord::Base
  validates_uniqueness_of :name, case_sensitive: false
  validates_length_of :name, maximum: 50
end
