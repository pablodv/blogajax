require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "invalid with empty attributes" do
    posts = Post.new
    assert !posts.valid?
    assert posts.errors.invalid?(:title)
    assert posts.errors.invalid?(:body)
  end

end
