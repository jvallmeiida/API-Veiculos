class Api::ApiController < ApplicationController
  respond_to :json

  def veiculo_scope
    Veiculo.all
  end
end
