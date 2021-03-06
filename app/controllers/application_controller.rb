class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except:[:top]
  # 「ログイン認証されていなければ、ログイン画面へリダイレクトする」 ※ exceptでtopアクションを除外すること
  
  before_action :configure_permitted_parameters,if: :devise_controller?

def after_sign_in_path_for(resource)
  post_images_path
end


  protected  # protectedは他のコントローラからも参照可（privateは自分のコントロール内のみ）

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end


end
