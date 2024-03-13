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
      @title = @job.title
      @company = @job.company.name
      @location = @job.location
      @description = @job.job_description
      @soft_skills = @job.soft_skills
      @programming_languages = @job.programming_languages

      @address = @current_user.candidate.address
      @summary = @current_user.candidate.summary
      @tech_interest = @current_user.candidate.tech_interest
      @tech_languages = @current_user.candidate.tech_languages
      @preferred_companies = @current_user.candidate.preferred_companies


      client = OpenAI::Client.new
      chaptgpt_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: "I will give you information for a candidate's profile and the information for a job posting. I want you to cross-match the information on the candidate's skills focusing on key-words (particularly #{@address}, #{@summary}, #{@tech_interest}, #{@tech_languages} and #{@preferred_companies}) and the information on the job listing (particularly #{@title}, #{@job_description}, #{@soft_skills}, #{@programming_languages}, #{@location}) and return a ranking from highest match to poorest job match compatibility. Ensure you also consider if any word in the job listing's information matches a word in the candidate's summary."}]
      })
      @content = chaptgpt_response["choices"][0]["message"]["content"]
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
      render my_jobs_path, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :job_description, :soft_skills, :programming_languages, :work_visa, :salary, :benefits, :application_deadline, :date_posted, :location)
  end
end
