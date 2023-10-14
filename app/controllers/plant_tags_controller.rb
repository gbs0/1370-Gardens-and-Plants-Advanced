class PlantTagsController < ApplicationController
  # Mostrar um formulário com as opções de Tag
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
    @tags = Tag.all
  end

  # Rota de POST p/ salvar no banco o relacionamento entre plantas e tags
  def create
    # 1. Achar a planta a ser tageada.
    @plant = Plant.find(params[:plant_id])
    # 2. Achar a Tag que o usuário selecionou
    @tag = Tag.find(plant_tag_params[:tag])
    # 3. Gerar um modelo plant_tag novo p/ receber o relacionamento
    @plant_tag = PlantTag.new
    # 4. Associar a plant_tag a planta do primeiro passo
    @plant_tag.plant = @plant
    @plant_tag.tag = @tag
    # 5. Salvar o plant_tag no banco

    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private
  def plant_tag_params
    params.require(:plant_tag).permit(:tag)
  end
end
