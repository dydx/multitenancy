class Post < ActiveRecord::Base
  belongs_to :account
  belongs_to :user

  def author
    User.select(:email).where(id: self.user_id).collect(&:email)
  end
end
