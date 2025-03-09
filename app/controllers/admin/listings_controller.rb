module Admin
  class ListingsController < Admin::ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
  
    def index
      @listings = Listing.all
    end
  
    def edit
      @listing = Listing.find(params[:id])
    end
  
    def update
      @listing = Listing.find(params[:id])
      if @listing.update(listing_params)
        redirect_to admin_listings_path, notice: "Listing updated successfully."
      else
        render :edit
      end
    end
  
    def destroy
      @listing = Listing.find(params[:id])
      @listing.destroy
      redirect_to admin_listings_path, alert: "Listing deleted."
    end
  
    def approve
      @listing = Listing.find(params[:id])
      @listing.update(approved: true)
      redirect_to admin_listings_path, notice: "Listing approved."
    end
  
    private
  
    def listing_params
      params.require(:listing).permit(:title, :description, :price, :approved)
    end
  
    def require_admin
      redirect_to root_path, alert: "Not authorized!" unless current_user.admin?
    end
  end  
end
