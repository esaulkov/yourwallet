require 'rails_helper'

RSpec.describe Wallet, type: :model do
  
  describe "Associations" do
    it { should have_many(:transactions) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    subject { FactoryGirl.build(:wallet) }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_numericality_of(:balance).allow_nil }
  end
  
end
