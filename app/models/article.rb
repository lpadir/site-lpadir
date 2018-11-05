class Article < ActiveRecord::Base
    validates :titulo, presence: true, length: { minimum: 2, maximum: 50 }
    validates :descricao, presence: true, length: { maximum: 1000 }
end