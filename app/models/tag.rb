class Tag < ApplicationRecord
  has_many :plant_tags, dependent: :destroy
  has_many :plants, through: :plant_tags

  def self.categories
    ["Carnivores", "Poison", "Conifers", "Gramineas"]
  end

  # Como declarar o model Tag
  # x = Tag.new # Instância
  # objeto da classe tipo Tag
  # Qual a diferença entre os dois objetos?
  # x = Tag.categories
  # Acessar o método categories de dentro da classe Tag
end
