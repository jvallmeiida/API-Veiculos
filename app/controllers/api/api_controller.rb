class Api::ApiController < ApplicationController
  def veiculo_params
    params.permit(:marca, :veiculo, :ano, :descricao, :vendido)
  end

  def veiculo_scope
    Veiculo.all
  end
end
