# frozen_string_literal: true

require "spec_helper"

describe ChatroomUser do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:chatroom) }
  end
end
