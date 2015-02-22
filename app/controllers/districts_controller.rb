class DistrictsController < ApplicationController
  
  load_and_authorize_resource
  before_filter :authenticate_user!
  before_action :set_voivodships_names, only: [:new, :edit, :update, :create]
  respond_to :html
  # GET /districts
  # GET /districts.json
  def index
    if current_user.centralny? || current_user.okregowy?
    @districts = District.all
    respond_with(@districts)
    else 
    voivodship = Voivodship.find(params[:voivodship_id])
    @districts = voivodship.districts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @districts }
    end
  end
  end
  def list
    @user = current_user
    @districts = District.all
    respond_with(@districts)
  end

    def all
    @districts = District.all
    respond_with(@districts)
  end
  # GET /districts/1
  # GET /districts/1.json
  def show
    voivodship = Voivodship.find(params[:voivodship_id])
    @district = voivodship.districts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @district }
    end
  end

  # GET /districts/new
  def new
    voivodship = Voivodship.find(params[:voivodship_id])
    @district = voivodship.districts.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @district }
    end
  end

  # GET /districts/1/edit
  def edit
    voivodship = Voivodship.find(params[:voivodship_id])
    @district = voivodship.districts.find(params[:id])
  end

  # POST /districts
  # POST /districts.json
  def create
    voivodship = Voivodship.find(params[:voivodship_id])
    @district = voivodship.districts.create(district_params)

    respond_to do |format|
      if @district.save
        format.html { redirect_to [@district.voivodship, @district], notice: 'District was successfully created.' }
        format.json { render :show, status: :created, location: [@district.voivodship, @district] }
      else
        format.html { render :new }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /districts/1
  # PATCH/PUT /districts/1.json
  def update
    voivodship = Voivodship.find(params[:voivodship_id])
    @district = voivodship.districts.find(params[:id])

    respond_to do |format|
      if @district.update(district_params)
        format.html { redirect_to [@district.voivodship, @district], notice: 'District was successfully updated.' }
        format.json { render :show, status: :ok, location: [@district.voivodship, @district]}
      else
        format.html { render :edit }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    voivodship = Voivodship.find(params[:voivodship_id])
    @district = voivodship.districts.find(params[:id])
    @district.destroy
    respond_to do |format|
      format.html { redirect_to (voivodship_districts_url), notice: 'District was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def district_params
      params.require(:district).permit(:name, :valid_votes, :voters, :voivodship_id, :ballots, :multiple_x, :blank, :other, :user_ids =>[])
    end
    def set_voivodships_names
      @voivodships = Voivodship.all.map do |voivodship| [voivodship.name, voivodship.id]
      end
    end
    def set_voivodship
      @voivodship = Voivodship.find(params[:voivodship_id])
    end
    def set_committees
      # szukam  komitetów przypisanych do tego samego województwa co okręg
      @committee = Committee.map do |committee|
        [committee.name, committee.id]
      end
    end
end
