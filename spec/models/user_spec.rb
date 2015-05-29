require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Associations" do
    it { should have_many(:wallets) }
  end

  describe "validations" do
    subject (:user) { FactoryGirl.build(:user) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:email) }
    it do
      should allow_value(user.email).
        for(:email)
    end

    it { should validate_length_of(:name).is_at_most(50) }
    
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should validate_length_of(:password) }
#    it { should validate_uniqueness_of(:password) }
    it { should validate_numericality_of(:limit).allow_nil }
  end
  
end
