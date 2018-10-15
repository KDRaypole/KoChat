# frozen_string_literal: true

require "spec_helper"

describe Message do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:chatroom) }
  end
end
