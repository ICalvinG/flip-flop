class InterestsController < ApplicationController

  def show
  	 # @interest = Interest.find_by(id: params[:id], politician_id: params[:politician_id])

  	@interest = Interest.find_by(id: params[:id])
    # @politician = Politician.friendly.find(params[:politician_id])
    @politician = Politician.friendly.find(params[:politician_name])
    @issue = Issue.friendly.find(params[:id])

    if @politician
    else
      redirect_to root_path
    end
  end

end
