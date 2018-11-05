class Article < ActiveRecord::Base
    belongs_to :usuario
    validates :titulo, presence: true, length: { minimum: 2, maximum: 50 }
    validates :descricao, presence: true, length: { maximum: 1000 }
end