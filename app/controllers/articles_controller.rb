class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :show, :update, :destroy]
	def index
		@articles = Article.paginate(page: params[:page], per_page: 3 )
	end

	def new
		@article = Article.new
	end 

	def edit
		
	end

	def create
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			flash[:notice] = "Article created"
			redirect_to article_path(@article)
		else
			render 'new'
		end	
	end
	
	def update
		if @article.update(article_params)
			flash[:notice] = "Article updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show
		
	end

	def destroy
		if @article.destroy
			redirect_to articles_path
			flash[:notice] = "Article deleted"
		end
	end

	private 
	def set_article
		@article = Article.find(params[:id])
	end
	def article_params
		params.require(:article).permit(:title, :description)
	end
end