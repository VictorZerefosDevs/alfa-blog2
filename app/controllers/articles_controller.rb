class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		@article.save
		if @article.save
			flash[:notice] = "Article created"
			redirect_to article_path(@article) 
		else
			render 'new'
		end	
		
	end

	def show
		@article = Article.find(params[:id])
	end

	private 
	def article_params
		params.require(:article).permit(:title, :description)
	end
end