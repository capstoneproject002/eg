class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_presence_of :name, :email

  validates_uniqueness_of :email

  before_create :set_password

  has_and_belongs_to_many :class_rooms

  has_many :attachments

  def set_password
    if Rails.env.production?
      generated_password = Devise.friendly_token.first(8)
    else
      generated_password = '12341234'
    end
    self.password = generated_password
  end

  def class_room_user_by_class_room(class_room)
    ClassRoomsUsers.where("user_id = ? AND class_room_id = ?", self.id, class_room.id).first
  end
end
