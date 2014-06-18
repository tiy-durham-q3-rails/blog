require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "published_at must not be before current date" do
    post = Post.new(title: "Test Post", body: "lorem")
    post.published_at = Date.today - 1.day
    refute post.valid?
    refute post.errors[:published_at].empty?
  end
end
