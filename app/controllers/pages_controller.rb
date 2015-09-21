class PagesController < ApplicationController
  def index
    @accounts = Account.select(:subdomain).distinct
  end
end
