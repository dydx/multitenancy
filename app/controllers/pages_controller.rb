class PagesController < ApplicationController
  def index
    @accounts = Account.all
    @posts = Post.all
  end
end
