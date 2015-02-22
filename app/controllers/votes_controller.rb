class VotesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource   

  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_district, only: [:new, :edit, :update, :create]
  before_action :set_committees, only: [:new, :edit, :update, :create]
  #before_action :set_districts, only: [:new, :edit, :update, :create]
 # before_action :set_districts_names, only: [:new, :edit, :update, :create]

  respond_to :html
 def index
    @votes = Vote.all
    respond_with(@votes)
  end

  def show
    respond_with(@vote)
  end

  def new

    @vote = Vote.new
    respond_with(@vote)
  end

  def edit
  end

    def destroy
    @vote.destroy
    respond_with(@vote)
  end


  def create

    @vote = Vote.new(vote_params)
    @vote.save
    respond_with(@vote)
  end

  def update
    @vote.update(vote_params)
    respond_with(@vote)
  end

  private

    def vote_params
      params.require(:vote).permit(:number, :district_id, :committee_id, :user_id)
    end

    def set_vote
      @vote = Vote.find(params[:id])
    end
      def set_districts_names
      @districts = District.all.map do |district| [district.name, district.id]
      end
    end
    def set_districts
      @districts = District.find(params[:district_id])
    end
    def set_district
      @district = current_user.districts
    end

    def set_committees
      # szukam okręgu, do którego należy zalogowany użytkownik
      distr = District.find_by_id(current_user.districts)
      # szukam  komitetów przypisanych do tego samego województwa co okręg
      @committees = distr.voivodship.committees.map do |committee|
        [committee.name, committee.id]
      end
    end

end

