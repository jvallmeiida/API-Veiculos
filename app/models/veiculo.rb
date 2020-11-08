class Veiculo < ApplicationRecord
  validates :marca, presence: true
  validates :veiculo, presence: true
  validates :ano, presence: true
  validates :descricao, presence: true
  validates :vendido, presence: true
end
