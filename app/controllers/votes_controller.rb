class VotesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource   

  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_district, only: [:index, :new, :edit, :update, :create]
  before_action :set_committees, only: [:new, :edit, :update, :create]
  #before_action :set_districts, only: [:new, :edit, :update, :create]
 # before_action :set_districts_names, only: [:new, :edit, :update, :create]

  respond_to :html

 def index
    #1st you retrieve the post thanks to params[:post_id]
    district = District.find(params[:district_id])
    #2nd you get all the comments of this post
    @votes = district.votes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
    end
  end

   def show
    #1st you retrieve the post thanks to params[:post_id]
     district = District.find(params[:district_id])
    #2nd you retrieve the comment thanks to params[:id]
    @vote = district.votes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @votes }
    end
  end

  def new
   district = District.find(params[:district_id])
    @vote = district.votes.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end

  end

   def edit
    #1st you retrieve the post thanks to params[:post_id]
     district = District.find(params[:district_id])
    #2nd you retrieve the comment thanks to params[:id]
    @vote = district.votes.find(params[:id])
  end

def destroy
    #1st you retrieve the post thanks to params[:post_id]
    district = District.find(params[:district_id])
    #2nd you retrieve the comment thanks to params[:id]
    @vote = district.votes.find(params[:id])
    @vote.destroy

    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(district_votes_url) }
      format.xml  { head :ok }
    end
  end


 def create
    #1st you retrieve the post thanks to params[:post_id]
  district = District.find(params[:district_id])
    #2nd you create the comment with arguments in params[:comment]
    @vote = district.votes.create(vote_params)

    respond_to do |format|
      if @vote.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@vote.district, @vote], :notice => 'Vote was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @vote, :status => :created, :location => [@vote.district, @vote] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end
def update
    #1st you retrieve the post thanks to params[:post_id]
    district = District.find(params[:district_id])
    #2nd you retrieve the comment thanks to params[:id]
    @vote = district.votes.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@vote.district, @vote], :notice => 'Vote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
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
      @district = District.find(params[:district_id])
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

