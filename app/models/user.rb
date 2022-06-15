class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  def generate_jwt
    JWT.encode({ id: id, exp: 30.days.from_now.to_i }, 'vicSecret')
  end
end
