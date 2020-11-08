class Api::VeiculosController < Api::ApiController

  def index
    @veiculos = Veiculo.all

    render json: @veiculos
  end
  
  def show
    @veiculos = Veiculo.find(params[:id])
    
    render json: @veiculos
  end
  
  def create
    @veiculo = Veiculo.new(veiculo_params)
    if @veiculo.save 
      render json: @veiculo, status: :created
    else
      render json: @veiculo.errors, status: :unprocessable_entity
    end
  end
  
  def update
    @veiculo = Veiculo.find(params[:id])
   
    if @veiculo.update(veiculo_params)
      render json: @veiculo
    else
      render json: @veiculo.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    
    @veiculo = Veiculo.find(params[:id])
    @veiculo.destroy  
  end
  
  private
  
    def veiculo_params
      params.permit(:marca, :veiculo, :ano, :descricao, :vendido)
    end
end
