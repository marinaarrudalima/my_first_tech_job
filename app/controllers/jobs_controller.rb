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
    # @jobs = Job.search_by_title_programming_languagues_companyname(params[:query]) if params[:query].present?
#     if current_user.present? && current_user.role_candidate?
# #AI
#     client = OpenAI::Client.new
#     chaptgpt_response = client.chat(parameters: {
#       model: "gpt-3.5-turbo",
#       messages: [{ role: "user", content: "Give me a simple recipe for #{@recipe.name} with the ingredients #{@recipe.ingredients}. Give me only the text of the recipe, without any of your own answer like 'Here is a simple recipe'."}]
#     })
#     @content = chaptgpt_response["choices"][0]["message"]["content"]
#   end
#     end
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
    params[:job][:tech_interests].delete_if(&:empty?)
    params[:job][:programming_languages].delete_if(&:empty?)
    params.require(:job).permit(:title, :job_description, :soft_skills, :work_visa, :salary, :benefits, :application_deadline, :date_posted, :location, :tech_interests=>[], :programming_languages=>[])
  end
end
