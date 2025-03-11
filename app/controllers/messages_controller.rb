class MessagesController < ApplicationController
    before_action :set_listing

    def create
        @message = Message.new(message_params)
        @message.user = current_user
        @message.listing = @listing

        if @message.save
        redirect_to @listing, notice: "Sporočilo je bilo uspešno poslano."
        # Pošljite e-pošto lastniku (neobvezno)
        MessageMailer.send_message(@message).deliver_now
        else
        redirect_to @listing, alert: "Sporočilo ni bilo poslano. Poskusite znova."
        end
    end

    private

    def set_listing
        @listing = Listing.find(params[:listing_id])
    end

    def message_params
        params.require(:message).permit(:content)
    end
end
