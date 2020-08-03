class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
    protect_from_forgery with: :exception

    private
    #sign_up時の登録情報追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) # ログイン時はnameを使用
    end
    
      protected
    
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
        #sign_upの際にnameのデータ操作を追加したカラム。
      end
    
    
end
