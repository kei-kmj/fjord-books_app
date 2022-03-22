# frozen_string_literal: true

class User < ApplicationRecord
  has_many :follower, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :following, class_name: 'Follow', foreign_key: 'following_id', dependent: :destroy, inverse_of: :following
  has_many :following_user, through: :follower, source: :following # I'm following
  has_many :follower_user, through: :following, source: :follower # My follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  # ユーザーをフォローする
  def create_follow(user_id)
    follower.create(following_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(following_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end
