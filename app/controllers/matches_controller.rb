class MatchesController < ApplicationController
  def my_matches
    @matches = Match.where(candidate_id: current_user.candidate.id)
  end

  def create
    @match = Match.new(job_id: params[:job_id], candidate_id: current_user.candidate.id)
    if @match.save
      redirect_to my_matches_path
    else
      render job_path(@match.job), status: :unprocessable_entity
    end
  end
end
