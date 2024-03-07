class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user = current_user
    if @candidate.save
      redirect_to candidates_path(:candidate)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    @candidate.user = current_user
    if @candidate.update(candidate_params)
      redirect_to candidate_path(@candidate), notice: 'Candidate was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @candidate = candidate.find(params[:id])
    @candidate.destroy
    redirect_to candidates_path(@candidate.user), status: :see_other
  end

  private

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :address, :nationality, :gender, :birth_date, :photo,
                                      :summary, :tech_interest, :tech_languages, :preferred_companies, :user_id)
  end
end
