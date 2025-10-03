class FrontController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'front'
  def index

  end

end
