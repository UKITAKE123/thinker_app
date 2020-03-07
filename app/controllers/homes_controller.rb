class HomesController < ApplicationController
  skip_before_action :login_required
  def about
  end

  def news
  end
end