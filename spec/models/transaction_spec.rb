require 'rails_helper'

RSpec.describe Transaction, type: :model do
  
  describe "Associations" do
    it { should belong_to(:wallet) }
    it { should belong_to(:purchase) }
  end

  describe "validations" do
    subject (:transaction) { FactoryGirl.build(:transaction) }
    before(:each) do
      transaction.sum = (transaction.sum).abs
    end
#    it do
#      should allow_value(transaction.date_time).
#        for(:date_time)
#    end
    it { should validate_presence_of(:wallet_id) }
    it { should validate_presence_of(:purchase_id) }
#    it { should validate_numericality_of(:sum).is_greater_than_or_equal_to(0.01) }
  end
end
