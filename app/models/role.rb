class Role < ApplicationRecord
  has_many :users

  PERMISSIONS = {
    'superadmin' => {
      all: {
        index: true,
        show: true,
        create: true,
        update: true,
        delete: true
      }
    },
    'admin' => {
      category: {
        index: true,
        show: true,
        create: true,
        update: true,
        destroy: true
      },
      job: {
        index: true,
        show: true,
        create: true,
        update: true,
        destroy: true
      }
    }
  }.freeze

  enum name: {
    user: 0,
    admin: 1,
    super_admin: 2
  }

  def has_permission?(action, resource)
    PERMISSIONS.dig(name, resource, action) ||
      PERMISSIONS.dig(name, :all, action)
  end

  validates :name, presence: true, uniqueness: true
end
