class SecretCodeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  protect_from_forgery

  def generate_secret_codes
    (1..params[:count].to_i).each do |count|
      code = SecureRandom.hex(5)
      SecretCode.new(code: code).save(validate: false)
    end
    redirect_to action: :index
  end

  def index
    @secret_codes = SecretCode.all
  end

  private

  #only User with admin role can access secret code index page.
  def check_admin
    if !current_user.admin?
      flash[:error] = "You dont have access to this Page!!!!!"
      redirect_to root_path
    end
  end
end