class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

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
    @jobs = Job.search_by_title_programming_languagues_companyname(params[:query]) if params[:query].present?
  end

  def show
    @job = Job.find(params[:id])
    @match = Match.new
    if current_user.present? && current_user.role_candidate?
      @content = @job.content(current_user)
    end
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
      render my_jobs_jobs_path, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params[:job][:tech_interests].delete_if(&:empty?)
    params[:job][:programming_languages].delete_if(&:empty?)
    params.require(:job).permit(:title, :job_description, :soft_skills, :work_visa, :salary, :benefits, :application_deadline, :date_posted, :location, :programming_languages=>[])
  end
end
