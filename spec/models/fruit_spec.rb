# == Schema Information
#
# Table name: fruits
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  type       :string(255)
#

require 'spec_helper'

describe Fruit do

  it { should belong_to :stair }

  it "should be quite delicious" do
    fruit = Fruit.new(:name => 'cranberry')
    fruit.deliciousness.should == 0.9
  end

  it "should loosen your poopen" do
    fruit = Fruit.new(:name => 'prune')
    fruit.dietary_fibre.should == 0.7
  end

  describe "An apple" do
    before do
      @apple = Apple.create(:name => 'Apple')
    end

    it "should not be squishy" do
      @apple.squishy?.should == false
      @apple.squishy?.should be_false #another way of describing the same as the first one.
      @apple.squishy?.should eq(false) #another way of describing the same as the first one.
    end

    it "should remember what class it is, using STI" do
      apple = Fruit.find(@apple.id)
      apple.should_not be_nil
      apple.should_not eq(nil)
      apple.should_not == nil

      apple.class.should == Apple
      apple.class.should eq(Apple)

      #Test its our ACTUAL apple.
      apple.should == @apple
      apple.should eq(@apple)

      #Test inheritance
      apple.is_a?(Fruit).should be_true
      apple.class.ancestors.should include Fruit
    end
  end

  describe "a pear" do
    before do
      @pear = Pear.create(:name => 'Pear')
    end

    it "should be kinda squishy" do
      @pear.squishy?.should == true
      @pear.squishy?.should be_true
      @pear.squishy?.should eq(true)
    end

    it "should remember what class it is, using STI" do
      pear = Fruit.find(@pear.id)
      pear.should_not be_nil
      pear.should_not eq(nil)
      pear.should_not == nil

      pear.class.should == Pear
      pear.class.should eq(Pear)

      #Test its our ACTUAL pear.
      pear.should == @pear
      pear.should eq(@pear)

      #Test inheritance
      pear.is_a?(Fruit).should be_true
      pear.class.ancestors.should include Fruit
    end
  end
end
