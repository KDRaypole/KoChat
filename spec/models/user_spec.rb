# frozen_string_literal: true

require "spec_helper"

describe User do
  let(:user) { FactoryGirl.create(:user) }

  describe "Validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "Associations" do
    it { should have_many(:messages) }
    it { should have_many(:chatroom_users) }
    it { should have_many(:chatrooms) }
  end
end
