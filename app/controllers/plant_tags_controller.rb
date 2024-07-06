class PlantTagsController < ApplicationController
  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    @plant = Plant.find(params[:plant_id])
    
    @tags = Tag.where(id: plant_tag_params[:tag])
    @tags.each do |tag|
      @plant_tag = PlantTag.new
      @plant_tag.tag = tag
      @plant_tag.plant = @plant
      @plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(tag: [])
  end
end
