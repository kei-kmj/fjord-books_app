# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#name_or_email" do
    user = User.new(email: 'foo@sample.com', name: '')
    assert_equal 'foo@sample.com', user.name_or_email

    user.name = 'piyo'
    assert_equal 'piyo', user.name_or_email
  end

  test '#follow_and_unfollow' do
    ben = User.create!(email: 'ben@example.com', password: 'benben')
    tom = User.create!(email: 'tom@example.com', password: 'tomtom')

    tom.follow(ben)
    assert tom.following?(ben)
    assert ben.followed_by?(tom)
    tom.unfollow(ben)
    assert_not tom.following?(ben)
    assert_not ben.followed_by?(tom)
  end
end
