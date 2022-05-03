class User < ApplicationRecord
  has_secure_password
  has_one :usuario, class_name: "usuario", foreign_key: "usuario_id"
end
