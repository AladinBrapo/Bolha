module Admin
  class CategoriesController < Admin::ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
  
    def index
      @categories = Category.all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path, notice: "Category created successfully."
      else
        render :new
      end
    end
  
    def edit
      @category = Category.find(params[:id])
    end
  
    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to admin_categories_path, notice: "Category updated successfully."
      else
        render :edit
      end
    end
  
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categories_path, alert: "Category deleted."
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name)
    end
  
    def require_admin
      redirect_to root_path, alert: "Not authorized!" unless current_user.admin?
    end
  end  
end
