# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validate :post_code_format

  private

  def post_code_format
    # 空欄でなければバリデーションチェックする
    return if post_code.blank?

    post_code_pattern = /[0-9]{3}+-[0-9]{4}/
    return if post_code_pattern.match(post_code)

    errors.add(:post_code, I18n.t('please_enter_with_3_single-byte_numbers_+_hyphen_(-)_+_4_single-byte_numbers'))
  end
end
