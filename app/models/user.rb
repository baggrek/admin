class User < ApplicationRecord
    has_secure_password
    
    validates_presence_of :first_name, :last_name, :address, :email, :tlp, :password_digest
    validates :email, uniqueness: true
end
