class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :articles
  has_many :comments, as: :commentable
  #Pour retrouver les commentaires d'un user :
  #Comment.where(user_id: User.find(id))
  has_many :sent_messages, class_name: "Message", foreign_key: "from_id"
  has_many :received_messages, class_name: "Message", foreign_key: "to_id"

  after_create :send_welcome

  def send_welcome
  	user = User.last
    UserMailer.welcome_email(user).deliver_now
  end

  def is_admin?
    self.role == "admin"
  end
end
