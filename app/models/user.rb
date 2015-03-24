class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_many :workitems
  has_many :offers
  
  enum user_type: { customer:  0, performer: 1, admin: 2, guest: 0 }

  def is_customer?
  	user_type == "customer"
  end

  def is_performer?
  	user_type == "performer"
  end

  def is_admin?
  	user_type == "admin"
  end
end
