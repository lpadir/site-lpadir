class Porta < ActiveRecord::Base
    
    validates :local, presence: true
    validates :comodo, presence: true
    
end