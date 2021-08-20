class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  protected
  # protectedは他のコントローラからも参照可（privateは自分のコントロール内のみ）

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end


end
