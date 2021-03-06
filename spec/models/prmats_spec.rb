require 'rails_helper'

describe "Prmats" do
  it "has a valid factory" do
    expect(FactoryBot.build(:prmat)).to be_valid
  end
  it "should act_as_list" do
    expect(FactoryBot.build(:prmat)).to respond_to(:move_to_top)
  end
  it "should have accessible :name" do
    expect { Prmat.new(name: 'name') }.not_to raise_error
  end
  it "should have many :samples" do
    t = Prmat.reflect_on_association(:samples)
    expect(t.macro).to eq(:has_many)
  end

  it "is invalid without :name" do
    expect(FactoryBot.build(:prmat, name: nil)).not_to be_valid
  end

  it "does not allow duplicate :name" do
    FactoryBot.create(:prmat, name: "1")
    expect(FactoryBot.build(:prmat, name: "1")).not_to be_valid
  end
end
