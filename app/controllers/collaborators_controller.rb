class CollaboratorsController < ApplicationController
	before_action :set_wiki

	def create
		@collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
	    if @collaborator.save
	  		flash[:notice] = "Collaborator was added."
	  		redirect_to edit_wiki_path(@wiki)
	  	else
	  		flash[:error] = "There was a problem adding your collaborator. Please try again."
	  		redirect_to edit_wiki_path(@wiki)
	  	end
	end

	def destroy
		@collaborator = Collaborator.find(params [:id])
		if @collaborator.destroy
  			flash[:notice] = "Collaborator was utterly destroyed!"
  			redirect_to edit_wiki_path(@wiki)
  		else
  			flash[:error] = "There was an error destroying your collaborator. Please try again."
  			redirect_to edit_wiki_path(@wiki)
  		end
	end

	private 

	def set_wiki
		@wiki = Wiki.find(params[:wiki_id])
	end
end