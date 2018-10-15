# frozen_string_literal: true

require "spec_helper"

describe Chatroom do
  describe "Associations" do
    it { should have_many(:users) }
    it { should have_many(:chatroom_users) }
    it { should have_many(:messages) }
    it { should belong_to(:owner) }
  end
end
