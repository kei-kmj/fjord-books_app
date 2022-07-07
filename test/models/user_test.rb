# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @ben = User.create!(email: 'ben@example.com', password: 'benben')
    @tom = User.create!(name: 'Tom', email: 'tom@example.com', password: 'tomtom')
  end

  test '名前未入力user(Ben)はメアドを返す' do
    assert_equal 'ben@example.com', @ben.name_or_email
  end

  test '名前入力済user(Tom)は名前を返す' do
    assert_equal 'Tom', @tom.name_or_email
  end

  test 'TomはBenをフォローする' do
    @tom.follow(@ben)
    assert @tom.following?(@ben)
  end

  test 'BenはTomをフォローしていない' do
    assert_not @ben.followed_by?(@tom)
  end

  test 'TomはBenのフォローをやめる' do
    @tom.follow(@ben)
    @tom.unfollow(@ben)
    assert_not @tom.following?(@ben)
  end
end
