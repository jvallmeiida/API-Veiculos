require "rails_helper"

RSpec.describe "Veiculos", type: :request do
  
  describe "GET /veiculos" do
    context "testing my endpoint index/show" do
      let(:veiculo) do
        Veiculo.create(marca: "fiat", veiculo: "palio", ano: 2000, descricao:"bom estado", vendido: true) 
      end
      it "returns status 200" do
        veiculo
        get "/api/veiculos"
        expect(JSON.parse(response.body)).to eq(
          [{"id" => 1,
            "marca" => "fiat",
            "veiculo" => "palio",
            "ano"=> 2000,
            "descricao" => "bom estado",
            "vendido" => true,
            "created_at" => veiculo.created_at.as_json,
            "updated_at" => veiculo.updated_at.as_json
          }]
        )
      end
    end
  end
  
  describe "POST /veiculos" do
    context "testing my endpoint created" do
      it "returns status 201 and created in db" do
        post "/api/veiculos/", params:{
            "marca" => "fiat",
            "veiculo" => "palio",
            "ano"=> 2000,
            "descricao" => "bom estado",
            "vendido" => true,
        }
        veiculo = Veiculo.first
        expect(response.code).to eq "201"
        expect(JSON.parse(response.body)).to eq(
          "id" => 1,
          "marca" => "fiat",
          "veiculo" => "palio",
          "ano"=> 2000,
          "descricao" => "bom estado",
          "vendido" => true,
          "created_at" => veiculo.created_at.as_json,
          "updated_at" => veiculo.updated_at.as_json
        )
        
      end
    end  
  end

  describe "PUT /veiculos" do
     context "testing my endpoint update" do
      let(:veiculo) do
        Veiculo.create(marca: "fiat", veiculo: "palio", ano: 2000, descricao:"bom estado", vendido: true) 
      end
      it "returns status 200" do
        put "/api/veiculos/#{veiculo.id}", params:{
          marca: 'fiat',
          veiculo: 'palio',
          ano: 2000,
          descricao:'bom',
          vendido:true
        }
        veiculo = Veiculo.first
        expect(response.code).to eq "200"
        expect(JSON.parse(response.body)).to eq(
          "id" => 1,
          "marca" => "fiat",
          "veiculo" => "palio",
          "ano"=> 2000,
          "descricao" => "bom",
          "vendido" => true,
          "created_at" => veiculo.created_at.as_json,
          "updated_at" => veiculo.updated_at.as_json
        )
      end
    end
  end

  describe "DELETE /veiculos" do
    context "testing my endpoint delete" do
      let(:veiculo) do
        Veiculo.create(marca: "fiat", veiculo: "palio", ano: 2000, descricao:"bom estado", vendido: true) 
      end
      it "returns status 204" do
        delete "/api/veiculos/#{veiculo.id}"
        expect(response.status).to eq 204
        expect(Veiculo.count).to eq(0)
      end
    end
  end
end