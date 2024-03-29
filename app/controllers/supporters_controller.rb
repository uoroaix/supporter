class SupportersController < ApplicationController

	before_action :find_supporter, only: [:show, :edit, :destroy, :update, :status]

	def index
	end

	def list
		@supporters = Supporter.all.paginate({per_page: 5, page: params[:page]})

		session[:current_page] = params[:page]
		
		if params[:search]
			@search_term = params[:search]
			@supporters = @supporters.search_by(@search_term)
		end

	end

	def status
	
		# session[:current_page] = params[:page]

		if @supporter.status == "Done"
			@supporter.status = "Not Done"
		else
			@supporter.status = "Done"
		end

		@supporter.save
		redirect_to list_path(page: session[:current_page])

	end

	def create
		@supporter = Supporter.new(supporter_attributes)

			if @supporter.save
			# flash[:notice] = "Your question was created successfully!"
				redirect_to root_path, notice: "Thank you for submitting your request!"
			else
				render :new
			end
	end

	def new
		@supporter = Supporter.new
	end

	def edit
	end

	def show
	end

	def update

		if @supporter.update_attributes(supporter_attributes)
			redirect_to list_path(page: session[:current_page]), notice: "Request edited successfully!"
		else
			render :edit
		end

	end

	def destroy
		if @supporter.destroy
			redirect_to list_path, notice: "Request deleted!"
		else
			redirect_to list_path, error: "We have trouble deleting it!"
		end
	end

	private

	def supporter_attributes
		params.require(:supporter).permit([:name, :email, :department, :message])
	end

	

	def find_supporter
		@supporter = Supporter.find(params[:id])
	end

end
