class User < ApplicationRecord

  has_one :secret_code
  before_save :set_user_role , :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_user_role
    if self.role == nil
      self.role = "user"
    end
  end

  def admin?
    return true if self.role.to_s == "admin"
    return false
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
