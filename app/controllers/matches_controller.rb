class MatchesController < ApplicationController
  def my
    @matches = Match.where(candidate: current_user.candidate)
  end

  def index
    @job = current_user.company.jobs.find(params[:job_id])
    @matches = Match.where(job: @job)
  end

  def create
    @job = Job.find(params[:job_id])
    @match = Match.new
    @match.candidate = current_user.candidate
    @match.job = @job

    @match.save!
    redirect_to my_matches_path
  end

  def update
    @match = Match.find(params[:id])
    @match.update!(match_params)
    redirect_to job_matches_path(@match.job)
  end

  private

  def match_params
    params.require(:match).permit(:status)
  end
end
