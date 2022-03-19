# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  validate :image_content_type, if: :was_attached?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def was_attached?
    self.image.attached?
  end

  def image_content_type
    extension = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif']
    errors.add(:image, "の拡張子が有効ではありません。.png/.jpg/.gif") unless image.content_type.in?(extension)
  end

end
