class Usuario < ActiveRecord::Base
    validates :username, presence: true, uniqueness: { case_sensitive: false },
    length: { minimun:4, maximum: 100 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :email, presence: true, uniqueness: { case_sensitive: false },
    length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
end