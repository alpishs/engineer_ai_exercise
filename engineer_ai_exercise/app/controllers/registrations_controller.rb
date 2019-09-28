class RegistrationsController < Devise::RegistrationsController

  def create
    begin
      secretcode = SecretCode.where(code: params[:secret_code],user_id: nil).first
      build_resource(sign_up_params) # will be the similar to user = User.new(sign_up_params)

      if secretcode.blank?
        flash.now[:alert] = "Secret Code not found"
        return render :new
      end

      if resource.save
        secretcode.update(user_id:resource.id)
        sign_in(resource)
        redirect_to controller: :home,action: :index
      else
        return render :new
      end
    rescue => e
      err = "Error while doing signup"
      unless Rails.env.test?
        ::Rails.logger.error err
        ::Rails.logger.error e.inspect
        ::Rails.logger.error e.backtrace
      end
      return render :new
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
  end
end