class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout 'main'
  include Pundit
  
end
