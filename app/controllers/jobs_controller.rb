class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.company = current_user.company
    if @job.save
      redirect_to companies_path(@company)
    else
      render jobs_path, status: :unprocessable_entity
    end
  end

  def index
    @jobs = Job.all
  end

  def my_jobs
    @jobs = Job.where(company_id: current_user.company.id)
  end

  def show
    @job = Job.find(param[:id])
  end

  def edit
    @job = Job.find(param[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.user = current_user
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def job_params
    params.require(:job).permit(:title, :job_description, :soft_skills, :programming_languages, :work_visa, :salary, :benefits, :application_deadline, :date_posted)
  end
end
