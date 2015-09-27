class StaticPagesController < ApplicationController
  def login
  end
  def success
    redirect_to 'success.html.haml'
  end
end
