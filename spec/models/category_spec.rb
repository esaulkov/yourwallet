require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_length_of(:name) }
  
end
