class VoivodshipsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  respond_to :html

  def index
    @voivodships = Voivodship.all
    respond_with(@voivodships)
  end

  def show
   @voivodship = Voivodship.includes(:committees).find(params[:id])
  end

  def new
    @voivodship = Voivodship.new
    respond_with(@voivodship)
  end

  def edit
  end

  def create
    @voivodship = Voivodship.new(voivodship_params)
    @voivodship.save
    respond_with(@voivodship)
  end

  def update
    @voivodship.update(voivodship_params)
    respond_with(@voivodship)
  end

  def destroy
    @voivodship.destroy
    respond_with(@voivodship)
  end

  private

    def set_voivodship
      @voivodship = Voivodship.find(params[:id])
    end
    def committees
      @committees = @voivodship.committees.map do |committee|
        [committee.name, committee.id]
      end
    end
    def voivodship_params
      params.require(:voivodship).permit(:name, :councilman,  {:committee_ids => []})
    end
end
