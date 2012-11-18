require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  describe "Comment" do
    it "should need body" do
      comment = Comment.create()
      comment.errors[:body].include?("can't be blank").must_equal true
    end
  end
end
