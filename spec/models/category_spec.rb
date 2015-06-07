require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Associations" do
    it { should have_many(:purchases) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    subject { FactoryGirl.build(:category) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_most(50) }
  end  
end
