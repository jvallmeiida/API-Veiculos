class Api::VeiculosController < Api::ApiController
  respond_to :json

  def index
    load_veiculos
  end

  def show
    load_veiculo
  end

  def create
    build_veiculo
    save_veiculo
  end

  def update
    load_veiculo
    build_veiculo
    update_veiculo
  end

  def destroy
    load_veiculo
    destroy_veiculo
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
    render json: @veiculo.errors, status: :unprocessable_entity unless @veiculo.destroy

    render json: @veiculo, status: :destroyed
  end

  def save_veiculo
    render json: @veiculo.errors, status: :unprocessable_entity unless @veiculo.save

    render json: @veiculo, status: :created
  end

  def update_veiculo
    render json: @veiculo.errors, status: :unprocessable_entity unless @veiculo.update

    render json: @veiculo, status: :updated
  end

  def veiculo_params
    params.permit(:marca, :veiculo, :ano, :descricao, :vendido)
  end
end
