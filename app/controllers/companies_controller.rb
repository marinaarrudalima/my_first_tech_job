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

  def show
    user = User.find(params[:id])
    @company = user.company
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
    params.require(:company).permit(:name, :headquarters, :industry, :description, :contact_info, :logo)
  end
end
