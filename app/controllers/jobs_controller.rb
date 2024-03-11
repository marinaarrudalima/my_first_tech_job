class JobsController < ApplicationController

  def new
    if current_user.role_candidate?
      redirect_to root_path
      return
    end

    @job = Job.new
  end

  def create
    if current_user.role_candidate?
      redirect_to root_path
      return
    end

    @job = Job.new(job_params)
    @job.company = current_user.company
    if @job.save
      redirect_to jobs_path(@job)
    else
      render jobs_path, status: :unprocessable_entity
    end
  end

  def index
    @jobs = Job.all
  end

  def my_jobs
    if current_user.company
      @jobs = Job.where(company_id: current_user.company.id)
    else
      @jobs = Job.all
    end
  end

  def show
    @job = Job.find(params[:id])
    @match = Match.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.company = current_user.company
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to my_jobs_path
    else
      render my_jobs_path, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :job_description, :soft_skills, :programming_languages, :work_visa, :salary, :benefits, :application_deadline, :date_posted, :location)
  end
end
