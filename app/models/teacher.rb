class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_presence_of :name, :email

  validates_uniqueness_of :email

  before_create :set_password

  def set_password
    if Rails.env.production?
      generated_password = Devise.friendly_token.first(8)
    else
      generated_password = '12341234'
    end
    self.password = generated_password
  end
end
