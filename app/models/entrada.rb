class Entrada < ActiveRecord::Base
    belongs_to :usuario
    belongs_to :porta
end