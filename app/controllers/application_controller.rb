class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  # skip_before_action :verify_authenticity_token]

  private

  def after_sign_in_path_for(resource)
    session["user_return_to"] || articles_path
  end

  def after_sign_out_path_for(resource_or_scope)
    articles_path
  end
end
