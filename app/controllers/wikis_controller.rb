class WikisController < ApplicationController
  def index
  	@wikis = Wiki.visible_to(current_user)
    authorize @wikis
  end

  def show
  	@wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
  	@wiki = Wiki.new
    authorize @wiki
  end

  def create
  	@wiki = Wiki.new(wiki_params)
    authorize @wiki
  	if @wiki.save
  		flash[:notice] = "Wiki was saved."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was a problem saving your wiki. Please try again."
  		render :new
  	end
  end

  def edit
  	@wiki = Wiki.find(params[:id])
  end

  def update
  	@wiki = Wiki.find(params[:id])
  	if @wiki.update_attributes(wiki_params)
  		flash[:notice] = "Wiki was successfully updated."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was a problem updating your wiki.  Please try again!"
  		render :edit
  	end
  end

  def destroy
  	@wiki = Wiki.find(params[:id])
  	if @wiki.destroy
  		flash[:notice] = "Wiki was utterly destroyed!"
  		redirect_to wikis_path
  	else
  		flash[:error] = "There was an error destroying your wiki. Please try again."
  		redirect_to @wiki
  	end
  end

  private

  def wiki_params
  	params.require(:wiki).permit(:title, :body, :private)
  end
end
