class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  belongs_to :role
  after_initialize :set_default_role

  validates :name, presence: true

  def admin?
    role.name == 'admin'
  end

  def super_admin?
    role.name == 'super_admin'
  end

  def has_permission?(action, resource)
    role&.has_permission?(action, resource)
  end

  def update_role!(role_name)
    self.role = Role.find_or_create_by(name: role_name)
    save!
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 30.days.from_now.to_i }, 'vicSecret')
  end

  private

  def set_default_role
    self.role ||= Role.find_by(name: 'user') if role.nil?
  end
end
