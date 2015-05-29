require 'rails_helper'

RSpec.describe Purchase, type: :model do
  
  describe "Associations" do
    it { should have_many(:transactions) }
    it { should belong_to(:category) }
  end

  describe "validations" do
    subject { FactoryGirl.build(:purchase) }
    it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
    it { should validate_length_of(:name).is_at_most(100) }
  end
  
end
