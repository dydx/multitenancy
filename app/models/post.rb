class Post < ActiveRecord::Base
  belongs_to :account
  belongs_to :user

  def author
    email = User.select(:email).where(id: self.user_id).collect(&:email)
    email.join("") # why do I have to do this???
  end
end
