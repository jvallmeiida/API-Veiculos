class Api::VeiculosController < Api::ApiController

  def index
    load_veiculos

    render json: @veiculos
  end

  def show
    load_veiculo

    render json: @veiculo
  end

  def create
    build_veiculo
    save_veiculo

    render json: @veiculo
  end

  def update
    load_veiculo
    build_veiculo
    update_veiculo

    render json: @veiculo
  end

  def destroy
    load_veiculo
    destroy_veiculo

    render json: @veiculos
  end

  private

  def load_veiculos
    @veiculos ||= veiculo_scope
  end

  def load_veiculo
    @veiculo ||= veiculo_scope.find(params[:id])
  end

  def build_veiculo
    @veiculo ||= Veiculo.new
    @veiculo.attributes = veiculo_params
  end

  def destroy_veiculo
    render json: @veiculo.errors, status unprocessable_entity unless @veiculo.destroy
  end

  def save_veiculo
    render json: @veiculo.errors, status: :unprocessable_entity unless @veiculo.save
  end

  def update_veiculo
    render json: @veiculo.errors, status: :unprocessable_entity unless @veiculo.update
  end
end
