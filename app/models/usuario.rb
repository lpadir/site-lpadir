class Usuario < ActiveRecord::Base
    has_many :articles, dependent: :destroy
    has_many :entradas
    
    before_save { self.email = email.downcase }
    
    validates :username, presence: true, uniqueness: { case_sensitive: false },
    length: { minimun:4, maximum: 100 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :email, presence: true, uniqueness: { case_sensitive: false },
    length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end