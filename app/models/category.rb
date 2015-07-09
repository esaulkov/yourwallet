class Category < ActiveRecord::Base
  has_many :purchases, dependent: :destroy
  belongs_to :user

  validates_uniqueness_of :name, case_sensitive: false, scope: :user_id
  validates_length_of :name, maximum: 50
end
