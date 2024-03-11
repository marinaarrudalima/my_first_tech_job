class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to company_path(@company)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @companies = Company.all
  end

  # tinha pensado que, para acessar todos os jobs da company precisariamos de um novo index
  # e minha dúvida é se esse index ficaria em jobs ou companies
  # def our
  #   @jobs = Companies.jobs
  #   @jobs.all
  # end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.user = current_user
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :headquarters, :industry, :description, :contact_info)
  end
end
