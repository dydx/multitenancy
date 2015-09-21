module PostsHelper

  def can_edit?
    signed_in? && current_user.id == @post.account.user_id
  end

  def belongs_to_tenant?
    allowed_users = Account.where(subdomain: request.subdomain).pluck(:user_id)
    signed_in? && allowed_users.include?(current_user.id)
  end

end
