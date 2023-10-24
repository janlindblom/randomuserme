require 'spec_helper'

describe Randomuserme do

  describe "#random_user" do
    it "fetches a new random user from randomuser.me" do
      ru = Randomuserme.random_user
    end
  end

  describe "#random_user(seed)" do
    it "fetches a user from randomuser.me with a given seed" do
      u1 = Randomuserme.random_user('123')
      u2 = Randomuserme.random_user('123')

      expect(u1).to eq(u2)
      expect(u1).to eql(u2)
    end
  end
end
