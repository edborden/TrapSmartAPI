class CompaniesController < ApplicationController

	def create
		company = Company.create company_params
		render json: company
	end

	def update
		company = Company.update params[:id], company_params
		render json: company.reload		
	end

	def index
		companies = Company.all
		render json: companies
	end

	def destroy
		company = Company.find params[:id]
		company.destroy
		head :no_content
	end

	def company_params
		params.require(:company).permit :name,:address,:locality,:region,:postcode,:premium
	end

end
