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

	#def destroy
	#	block = Block.find params[:id]
	#	block.destroy
	#	head :no_content
	#end

	def company_params
		params.require(:company).permit :name,:address,:locality,:region,:postcode
	end

end
