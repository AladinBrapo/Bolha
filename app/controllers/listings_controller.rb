class ListingsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :destroy]  # Ensure only authenticated users can create, edit, or delete listings
    before_action :correct_user, only: [:edit, :destroy]
    
    # app/controllers/listings_controller.rb
    def index
        if params[:query].present?
            @listings = Listing.where('LOWER(title) LIKE LOWER(?)', "%#{params[:query]}%")
        else
            @listings = Listing.all
        end
    end  

    def show
        @listing = Listing.find(params[:id])

        respond_to do |format|
            format.html  # Make sure HTML responses are allowed
            format.json { render json: @listing }
        end
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = current_user.listings.build(listing_params)
        if @listing.save
            redirect_to @listing, notice: 'Listing created successfully.'
        else
            render :new
        end
    end

    def edit
        @listing = Listing.find(params[:id])
    end

    def update
        @listing = Listing.find(params[:id])
        if @listing.update(listing_params)
        redirect_to @listing, notice: 'Listing updated successfully.'
        else
        render :edit
        end
    end

    def destroy
        @listing = Listing.find(params[:id])
        @listing.destroy
        redirect_to listings_path, notice: 'Listing deleted successfully.'
    end

    private

    def correct_user
        @listing = Listing.find(params[:id])
        unless @listing.user == current_user
          flash[:alert] = "You are not authorized to perform this action."
          redirect_to listings_path
        end
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :price, :category_id, :image).tap do |whitelisted|
            whitelisted[:price] = whitelisted[:price].to_f if whitelisted[:price].present?
        end
    end
end
  
