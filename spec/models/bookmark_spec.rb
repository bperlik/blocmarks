require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:topic) { Topic.create!(title: 'Topic Title') }
  let(:bookmark) { Bookmark.create!(url: 'www.fakeurl.com') }

  describe "attributes" do
    it "has a url attribute" do
      expect(bookmark).to have_attributes(url: 'www.fakeurl.com') }
    end
  end

end
