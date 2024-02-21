class User < ApplicationRecord
    has_one :profile
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, uniqueness:{ case_sensitive: false },
                     length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true, length: { minimum: 8 } 
    # validates :password_confirmation, presence: true, length: { minimum: 8 } 
    
end
