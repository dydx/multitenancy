class PagesController < ApplicationController
  def index
    @accounts = Account.all
  end
end
