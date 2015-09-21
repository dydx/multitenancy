class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account
  has_many :posts
  accepts_nested_attributes_for :account

  after_initialize :set_account

  private
  def set_account
    build_account unless account.present?
  end
end
